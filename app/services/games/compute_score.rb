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
    @game.game_player_runs.each do |gpr|
      run = gpr.run
      game_player = gpr.game_player
      previous_runs = @game.runs.where("end_datetime < ?", run.end_datetime)
      if previous_runs.empty?

      else
        previous_runs.each do |previous_run|
          intersection = run.polygone.intersection(previous_run.polygone)
          if intersection
            #update game_player.gained_area += intersection.area
            #update game_player.gained_territory_counter += 1
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

      # Trouver le bon game player
      game_player = GamePlayer.find_by(game: @game, player: player)
      # Mettre a jour le score du joueur dans le game player
      game_player.update(score: player_runs_area)
    end
    game_players = GamePlayer.where(game: @game).order(score: :desc)

    # Attribuer un rang à chaque joueur en fonction de l'ordre
    game_players.each_with_index do |game_player, index|
      game_player.update(ranking: index + 1)
    end

    return @scores

  end

end
