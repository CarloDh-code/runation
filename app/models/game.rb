require 'rgeo'
require 'fast_polylines'
require 'rgeo/geo_json'

class Game < ApplicationRecord
  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players
  has_many :game_player_runs, through: :game_players
  has_many :runs, through: :game_player_runs
  has_many :comments, dependent: :destroy

  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }

  MAP_POLYLINES = MAP_POLYLINES = {
    "Paris" => "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
    "Lyon" => "m~m|gbovG`alv~A}|@toCiqCxnCufB`|AklEpl}oFwjA_b@s}Chh@qfCzkL}dB",
    "Marseille" => "eku_@ohfgGqg@hylusIssAk`GkrE{aHsqAl_B{xEdaDa~BzwJtH`wNa`A{gEhpE?h~E",
    "Lille" => "wypQo|dtHlDpe@|mApnCebApwBqhFxp@ujBe_AmwB{d@kb@{zAziBiyBncEgc@",
    "Toulouse" => "_buGuojiGlpE~xC`}A|dDsjCznD{mJlgCsuDy_Amc@maGlr@irDj{D}aBfuDw"
  }
  validates :map_polyline, inclusion: {in: MAP_POLYLINES}



  def check_and_update_status!
    if status == "pending" && players.size == nb_of_players
      update!(status: "ongoing", start_date: Date.today, end_date: Date.today + duration.days)
    end
  end

  def coordinate
    decoded_polyline = self.decoded_path
    downsample_polyline(decoded_polyline)
  end

  def coordinate_layer
   # Inverser coordonnées car avec layer on doit mettre l'inverse
   data = coordinate
   data.map { |coord| [coord[1], coord[0]] }
  end

  def surface
    simplified_polyline = coordinate
    polygon = polyline_to_polygon(simplified_polyline).area
  end



  def decoded_path
    begin
    FastPolylines.decode(self.map_polyline)
    rescue StandardError => e
      Rails.logger.error("Failed to decode polyline: #{e.message}")
      nil
    end
  end

  def downsample_polyline(polyline)
    step = case polyline.size
           when 200..Float::INFINITY
             10
           when 100...200
             5
           when 50...100
             3
           when 20...50
             2
           else
             1
           end

    return polyline if polyline.size <= 3 || step <= 1

    first_point = polyline.first
    last_point = polyline.last

    downsampled = [first_point] + polyline[1...-1].each_slice(step).map(&:first) + [last_point]

    # S'assurer que le dernier point est identique au premier pour fermer le polygone
    downsampled[-1] = downsampled.first unless downsampled.last == downsampled.first

    downsampled
  end

  def polyline_to_polygon(polyline_decoded)
    return nil if polyline_decoded.nil?
    factory = RGeo::Geos.factory
    points = polyline_decoded.map { |lat, lon| factory.point(lat, lon) }
    polygon = factory.polygon(factory.linear_ring(points))
    if polygon.valid?
      polygon
    else
      polygon = polygon.make_valid
    end

  end

end
