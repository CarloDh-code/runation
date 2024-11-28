require 'rgeo'
require 'fast_polylines'
require 'rgeo/geo_json'

module Games
  class AssessRuns

    ### Algo
    # def remove_inner_loops(factory, polyline)
    #   # Convert polyline to RGeo geometry
    #   points = polyline.map { |lat, lon| factory.point(lon, lat) }

    #   # Create the linear ring and polygon
    #   ring = factory.linear_ring(points)
    #   polygon = factory.polygon(ring)

    #   # Check if the polygon is valid
    #   unless polygon.valid?
    #     puts "Invalid polygon detected. Simplifying..."
    #     # Optionally, handle the invalid polygon here (e.g., simplify or fix)
    #   end

    #   # Extract only the outer ring
    #   outer_ring = polygon.exterior_ring
    #   outer_points = outer_ring.points.map { |p| [p.y, p.x] }

    #   # Ensure the outer ring is closed
    #   outer_points << outer_points.first unless outer_points.first == outer_points.last

    #   # Return the closed outer points
    #   outer_points
    # end

    factory = RGeo::Cartesian.factory

    def downsample_polyline(polyline, step)
      return polyline if polyline.length <= 2 # Pas besoin de réduire s'il y a 2 points ou moins

      first_point = polyline.first
      last_point = polyline.last

      # Prendre 1 point sur 'step', en gardant toujours le premier et le dernier
      downsampled = [first_point] + polyline[1...-1].each_slice(step).map(&:first) + [last_point]

      # S'assurer que le dernier point est identique au premier pour fermer le polygone
      downsampled[-1] = downsampled.first unless downsampled.last == downsampled.first

      downsampled
    end

    ### Test 3 - creer des multipolygones
    def convert_to_valid_multipolygon(polygon, factory)
      begin
        # Vérification de validité du polygone
        if polygon.valid?
          puts "Le polygone est déjà valide."
          return factory.multi_polygon([polygon])
        end

        puts "Polygone invalide détecté, tentative de correction..."

        # Si le polygone est invalide, utiliser buffer(0) pour corriger
        repaired_polygon = polygon.buffer(0)

        if repaired_polygon.valid?
          puts "Le polygone a été réparé avec succès."
          return factory.multi_polygon([repaired_polygon])
        else
          puts "Le polygone réparé est toujours invalide."
          return nil
        end
      rescue RGeo::Error::InvalidGeometry => e
        puts "Erreur lors de la conversion en MultiPolygon : #{e.message}"
        return nil
      end
    end

    ### TEST 4
    # Récréer un polygone avec boundary
    def create_polygon_from_boundary(boundary, factory)
      # Extraire les points du LINESTRING (exterior_ring)
      points = boundary.points

      # S'assurer que le premier et le dernier point sont les mêmes pour fermer le polygone
      if points.first != points.last
        points << points.first
      end

      # Créer un anneau linéaire (LinearRing) à partir des points
      linear_ring = factory.linear_ring(points)

      # Créer un polygone à partir de cet anneau linéaire
      polygon = factory.polygon(linear_ring)

      # Vérifier si le polygone est valide
      if polygon.valid?
        puts "Le polygone est valide."
      else
        puts "Le polygone est invalide."
      end

      polygon
    end




# je fake le polygone du tour de paris
polyline_paris = [
  [48.8700, 2.3800],
  [48.9000, 2.4200],
  [48.9100, 2.4700],
  [48.8800, 2.4800],
  [48.8500, 2.4600],
  [48.8400, 2.4000],
  [48.8500, 2.3600],
  [48.8700, 2.3800],
]

# Je recupère le game et les deux runs
game = Game.find(32)
run_inclus = Run.find_by(strava_activity_id: 12316578164)
run_exclu = Run.find_by(strava_activity_id: 12807121651)

# Je decode leurs polylines

game_poly_decoded = game.decoded_path_game
game_poly_decoded = downsample_polyline(game_poly_decoded, 30)
game_poly_decoded = game_poly_decoded.to_set.to_a
game_poly_decoded[-1] = game_poly_decoded[0]


run_exclu_poly_decoded = run_exclu.decoded_path
run_exclu.decoded_path[-1] = run_exclu.decoded_path[0]


run_inclus_poly_decoded = run_inclus.decoded_path
run_inclus.decoded_path[-1] = run_inclus.decoded_path[0]


def polyline_to_polygon(factory, polyline_decoded)
  points = polyline_decoded.map { |lat, lon| factory.point(lon, lat) }
  factory.polygon(factory.linear_ring(points))
end

paris_polygon = polyline_to_polygon(factory, polyline_paris)
game_polygon = polyline_to_polygon(factory, game_poly_decoded)
game_multi_polygon = convert_to_valid_multipolygon(game_polygon, factory)

run_exclu_polygon = polyline_to_polygon(factory, run_exclu_poly_decoded)
run_inclus_polygon = polyline_to_polygon(factory, run_inclus_poly_decoded)

puts "Run Exclu inclus dans Game ? #{run_exclu_polygon.within?(game_polygon)}"
puts "Run Inclus inclus dans Game ? #{run_inclus_polygon.within?(game_polygon)}"






    ################################################### To do later
    # def initialize
    #   # @games = les jeux en cours
    #   @games = Games.where(status: 'ongoing')
    # end

    # def call
    #   # pour chaque jeu en cours ET qui a un polyline
    #   # pour chaque player du jeu en cours
    #   # pour chaque run dans le date range du jeu
    #   # est-ce que oui ou non la zone du run est incluse dans la zone du game ?
    #   # si oui, associer le run au game si pas deja fait
    #   @games.each do |game|
    #     next unless game.polyline.present?
    #     game.players.each do |player|
    #       runs_in_date_range = player.runs.where(start_datetime: game.start_date.beginning_of_day..game.end_date.end_of_day)
    #       runs_in_date_range.each do |run|
    #         if polyline_includes?(game.polyline, run.polyline)

    #         else

    #         end
    #       end
    #     end
    #   end
    # end

    # private

    # def polyline_includes?(game_polyline, run_polyline)


    # end
    #



  end
end
