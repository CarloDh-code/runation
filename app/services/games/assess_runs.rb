require 'rgeo'
require 'fast_polylines'
require 'rgeo/geo_json'

module Games
  class AssessRuns
    include PolygonConversion
    ################################################## To do later
    def initialize
      @games = Game.where(status: 'ongoing')
    end

    def call
      included_runs = {}

      @games.each do |game|
        next unless game.map_polyline.present?
        included_runs[game.id] = []

        game.players.each do |player|
          runs_in_date_range = player.runs.where(start_datetime: game.start_date.beginning_of_day..game.end_date.end_of_day)
          runs_in_date_range.each do |run|
            if polyline_to_polygon(run.decoded_path).within?(polyline_to_polygon(game.decoded_path))
              included_runs[game.id] << run
              gp = GamePlayer.where(game: game, player: player)
              GamePlayerRun.where(game_player: gp, run: run)
            end
          end
        end
      end
      included_runs
    end
  end
end
