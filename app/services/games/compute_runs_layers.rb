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
      '#a2922d', '#FF5964', '#38618C', '#35A7FF', '#ad72b3', '#61fab8',
      '#f29451', '#1c3d56', '#51cff2', '#561c23'
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
        player_name: run.player.name || "Joueur inconnu",  # Nom du joueur
        color: color # Couleur associée
      }
    end

    return @layers
  end
end
