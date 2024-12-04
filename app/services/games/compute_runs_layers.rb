class Games::ComputeRunsLayers
  def initialize(game)
    @game = game
    @layers = []
  end

  def call
    # assess_runs_service = Games::AssessRuns.new.runs_valid_for_game(@game.id)
    # valid_runs = assess_runs_service.runs_valid_for_game(game.id)

    # Récupérer tous les joueurs du jeu et leurs runs valides
    # players_runs = game.runs.order(:end_datetime).group_by(&:player_id)
    runs = @game.runs.order(:end_datetime)

    # Définir un tableau de couleurs prédéfinies
     colors = [
    '#2da25a',  # player1
    '#FF5964',  # player2
    '#38618C',  # player3
    '#35A7FF',  # player4
    '#ad72b3',  # player5
    '#de3a5d',  # player6
    '#f29451',  # player7
    '#1c3d56',  # player8
    '#51cff2',  # player9
    '#561c23'   # player10
  ]
    players_colors = @game.players.map.with_index do |player, index|
      [player.id, colors[index % colors.length]]
    end.to_h

    runs.each do |run|
      player_id = run.player.id
      color = players_colors[player_id]
      @layers << {
        coordinates: run.coordinate_layer,  # Assurez-vous que run.coordinate_layer existe
        player_id: player_id,
        player_name: run.player.nickname || "Joueur inconnu",  # Nom du joueur
        color: color # Couleur associée
      }
    end

    return @layers
  end
end
