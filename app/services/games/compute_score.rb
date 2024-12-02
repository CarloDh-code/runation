# {
#   <Run:0x00007f8b1b1b3b08>: <RGeo::Geos::CAPIPolygonImpl:0x3f9b1d8 "POLYGON ((-0.0000000000000000 0.0000000000000000, -0.0000000000000000 0.0000000000000000, -0.0000000000000000 0.0000000000000000, -0.0000000000000000 0.0000000000000000, -0.0000000000000000 0.0000000000000000))">,  
# }

class Games::ComputeScore
  def initialize(game)
    @game = game
    @runs_polygones = {}
    @game.runs.each do |run|
      @runs_polygones[run] = run.polygone
    end

    @scores = {}
  end

  def call
    @game.runs.each do |run|
      previous_runs = @game.runs.where("end_datetime < ?", run.end_datetime)
      if previous_runs.empty?

      else
        previous_runs.each do |previous_run|
          intersection = run.polygone.intersection(previous_run.polygone)
          if intersection
            previous_run_polygone = @runs_polygones[previous_run]
            previous_run_resulting_polygone = previous_run_polygone.difference(run.polygone)
            @runs_polygones[previous_run] = previous_run_resulting_polygone
          end
        end
      end
    end

    
    @game.players.each do |player|
      player_runs = @game.runs.where(player: player)
      players_polygones = @runs_polygones.select { |run, _| player_runs.include?(run) }.values
      player_runs_area = players_polygones.sum(&:area)
      @scores[player] = player_runs_area
    end

    return @scores

  end

  private



end

Games::ComputeScore.new(Game.last).call