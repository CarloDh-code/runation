require 'rgeo'
require 'fast_polylines'
require 'rgeo/geo_json'

module Games
  class AssessRuns
    # include PolygonConversion
    ################################################## To do later
    def initialize
      @games = Game.where(status: 'ongoing')
    end

    # On selectionne tous les games ongoing
    # On accède aux runs des joueurs associés à ce jeu
    # On vérifie la validité de leurs runs (date et inclusion dans polygone du game)
    # On crée un array avec tous les runs validés associés à la game qui doivent être représentés sur la map du jeu ongoing
    # On ajoute un GamePlayerRun pour associer ces runs aux jeux et au joueur qui a couru
    def all_games_ongoing
      included_runs = []
      @games.each do |game|
        next unless game.map_polyline.present?

        game.players.each do |player|
          runs_in_date_range = player.runs.where(start_datetime: game.start_date.beginning_of_day..game.end_date.end_of_day)
          runs_in_date_range.each do |run|
            if run.polyline_to_polygon(run.decoded_path).within?(game.polyline_to_polygon(game.decoded_path))
              included_runs << run
              gp = GamePlayer.find_by(game: game, player: player)
              unless GamePlayerRun.find_by(game_player_id: gp.id, run_id: run.id)
                GamePlayerRun.create(game_player_id: gp.id, run_id: run.id)
              end
            end
          end
        end
      end
      included_runs
    end

    # On reproduit la même logique sur un game en particulier (on le find avec l'id dans la show)
    # On crée un array vide pour stocker les runs valides de ce jeu
    # On vérifie la validité des runs de tous les players du jeu
    # On crée le gameplayerRun avec uniquement les runs valides
    def runs_valid_for_game(game_id)
      runs_valid = []
      game = Game.find(game_id)
      return runs_valid unless game.map_polyline.present?

      game.players.each do |player|
        runs_in_date_range = player.runs.during_game(game)
        runs_in_date_range.each do |run|
          if run.is_inside_game_area?(game)
            runs_valid << run
            gp = GamePlayer.find_by(game: game, player: player)
            unless GamePlayerRun.find_by(game_player_id: gp.id, run_id: run.id)
              GamePlayerRun.create(game_player_id: gp.id, run_id: run.id)
            end
          end
        end
      end
      runs_valid
    end
  end
end
