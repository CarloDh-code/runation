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

    MAP_POLYLINES = {
        "Paris" => "}|ciHmkxLaMuF_CgBz@HqFoBE_@uHeEiCs@}FuEqB]_CoBmCcBoLwGwAOk@wAyD}A}AqBuAe@gEgEe@AaNkMkI_GoBc@_H{G]VOw@qBqB{Dm@gJuK{C_FuA_FgBgKgCgC_D}DmD_GeFkKcBqFeCcEsDoJiG}LiDsImA}DeAuAsDi@mCvDu@S{AyEEgCoEgKwDuL{AwBeBuENq@}@kCiB}CcEyK^t@wDyH`AAsAeAi@G{@cCwAeKwCwDeAiJoBwFqBkHm@kEoDqJk@mDeAsBWeDRkBUuDNqBIwP_@eGXq@ByB[qCKiIFkM]aEBaEf@{Ci@eDa@eHHgITaJcAuGx@uCu@oMi@wn@o@_B@oC_@}BLkDQ{@|@s@AiM]wB\\qBOwC?}FRaHKgMSiD^uJa@_Dd@kJSwLc@qEb@{BEgB[yAO}FaAmAnAgFEoEe@_FF}Ee@qAAoAPiBFeFfCDf@|AzAo@McJ^yBn@gPnBqK|A{B|C_C`R_Dp@k@`Cd@OL~Q}ChBgAlFkAz@Np@m@nAVzAq@dEQv@{@n@P^aAfB{@dBaLv@{CbA_@vChB|AJfBgAxJoIt@cDeAeGrAkCt@qE~@kBvABxEoDlMmEjb@{BtPp@dBl@nB]]sAhCh@rDaAjAt@fMwBpGGnFgBlH@lI}AdBLpOcClIOtF_@pBf@p@t@lBExCdAxDTlA\\Xl@zJl@fBjAvGrBpBBnBpAfL`AjBf@xCxC`AXFtBbB~A`DzGdBrAn@jKzCvJ@v@rBlFn@xDjDlIpB~IJ~C~BrMfA~BnApFfLzZtAdAtApCn@jBEjAp@~@GtBvB|Q`DvF@~BzC~LfArDb@^hA|H\\\\dBxGdAlFUrAv@~BGhBr@d@~@nA@`B~AfEjAbHXvD`Ab@@dClAfBTlACjFs@|CV~Bi@vFk@zBgBjBcA`CoA~@e@~Sy@jH~CfL^|Cz@dCF~Cp@d@h@`BNlFOnI^|By@~B_Fp^{@xIi@jDkAfGGzCm@xD]XKzGe@xDDdDm@pAUbC}AxDGrA_AnCGjCiAnDSvF{@vF?vDqAdDk@xIy@xCBrDmAhBq@zG_DlQi@pJcA~Ee@v@?hCiA~FNZcBjDNzL_ApBeA`FOzDqAzEiBbN_CtI_A`GyB~GsBlDuAfHq@v@SvBNnB}BpCmHvUs@hFcAnC}@dFs@jHWZOrDk@jCIhG_EtMo@tGwAzAkAzD]vCqLvWu@`FiBfDKxD{@FM|CmAzDaAlCiAKeAlC}@QoDhCcFPmAl@",
        "Lyon" =>  "_smvGi|j\\bcA|jBt|Cj{BzlEshBnnF}`D]y{BhFuyBaS_|C_JqaEiAyfDcTwkCwh@c_Cw}Bos@ooCbMi_Bx@gtB`m@_cArlBwt@t~Aab@fsBec@b}DcNbrDjSnyDfzAdwD",
        "Marseille" => "{kvfGkhm`@_mH}vHioGkJclIbrAw]~yJ{hDj}N`Q~eE|}DbjAxwFghFh_Ev~Al{A_pCzuBoAf_EbfE`w@_nCeRkqLnPacG",
        "Lille" => "qu~sH{dnQnm@eeBrEerB?kjByk@gf@maAsAkuAvp@}WdgC|\\jlCnjChf@",
        "Toulouse" => "indiGurrG~`BjCn~@ohBqFgfCur@i}@i|@~D_fApe@qFdlArd@|oD",
        "Rilly-sur-Loire" => "oxm`H}hdEfdCajA~oCgtFxbAcrL{d@}cS_tAmrGotFcZ{lHz{AypB`yAkhB~hQzx@baM~^rrC|}BjeEh`DlbCfdDlE"
      }

  def days_left
    if status == "ongoing"
      (self.end_date - Date.today).to_i
    elsif status == "pending"
      self.duration
    else
      nil
    end
  end


  def check_and_update_status!
    if status == "pending" && players.size == nb_of_players
      update!(status: "ongoing", start_date: Date.today, end_date: Date.today + self.duration)
      send_notifications_to_all_players
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

  def polyline
    coords = decoded_path
    return downsample_polyline(coords)
  end

  def polygone
    polyline_to_polygon(polyline)
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



  def covered_surface_percentage
    total_score = game_players.sum(:score) # Somme des scores des joueurs
    total_surface = self.surface # La surface totale du jeu
    # Calcul du pourcentage arrondi sans décimale
    return ((total_score.to_f / total_surface.to_f) * 100).to_i
  end

  def self.total_runs(game_id)
    # Compter les entrées dans la table GamePlayerRun qui sont liées à ce jeu
    GamePlayerRun.joins(:game_player).where(game_player: { game_id: game_id }).count
  end


  def surface_in_km2
    # Calcule la surface en degrés carrés
    surface_in_degrees = self.surface # Supposons que `surface` soit en degrés carrés

    # Conversion en km² en multipliant par 8547
    surface_in_km2 = surface_in_degrees * 8547

    # Arrondir à l'entier le plus proche (sans décimales)
    surface_in_km2.to_i
  end


  # Méthode location
  def location
    location_name = MAP_POLYLINES.key(self.map_polyline)
    location_name || "Unknown"  # Retourne "Unknown" si aucune correspondance n'est trouvée
  end

  private

  def send_notifications_to_all_players
    self.players.each do |player|
      Notification.create!(
        title: "Game Notification",
        player: player,
        content: "The game #{self.name} has started"
      )
    end

    # if game.end_date == game.duration.days || game.status == 'finished'
    #   self.players.each do |player|
    #     Notification.create!(
    #       title: "Game-end notification",
    #       player: player,
    #       content: "The game #{self.name} has ended, your rank is "
    #     )
    #   end
    # end
  end
end
