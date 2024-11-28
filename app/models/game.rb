class Game < ApplicationRecord
  has_many :game_players, inverse_of: :game
  has_many :players, through: :game_players
  has_many :game_player_runs, through: :game_players
  has_many :runs, through: :game_player_runs
  has_many :comments, dependent: :destroy

  validates :status, presence: true, inclusion: { in: ["ongoing", "pending", "finish"] }


  def surface
    decoded_polyline = self.decoded_path
    simplified_polyline = downsample_polyline(decoded_polyline)
    polygon = polyline_to_polygon(simplified_polyline).area
  end

  private

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
    factory = RGeo::Geos.factory
    points = polyline_decoded.map { |lat, lon| factory.point(lon, lat) }
    polygon = factory.polygon(factory.linear_ring(points))
    if polygon.valid?
      polygon
    else
      polygon = polygon.make_valid
    end

  end

end
