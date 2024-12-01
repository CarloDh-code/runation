class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def show
    unless @game.status == 'pending' || @game.players.include?(current_player)
      redirect_to games_path, alert: 'You can not access this game, sorry ! '
    end
    game_run_layers

    @comments = @game.comments.includes(:player) if @game.status == "ongoing"
  end

  def index
    @games = Game.where(status: 'pending')
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.status = "pending"
    @game.game_players.new(player: current_player)
    if @game.save
      redirect_to @game, notice: "Game successfully created"
    else
      render :new
    end
  end

  def mine
    @games = current_player.games.order(end_date: :desc)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :nb_of_players, :start_date, :duration)
  end



  def game_run_layers
    @layers = []
    assess_runs_service = Games::AssessRuns.new
    valid_runs = assess_runs_service.runs_valid_for_game(@game.id)

    # Récupérer tous les joueurs du jeu et leurs runs valides
    players_runs = @game.runs.group_by(&:player_id)

    # Définir un tableau de couleurs prédéfinies
    colors = [
      '#a2922d',  # Joueur 1
      '#FF5964',  # Joueur 2
      '#38618C',  # Joueur 3
      '#35A7FF',  # Joueur 4
      '#ad72b3',  # Joueur 5
      '#61fab8',  # Joueur 6
      '#f29451',  # Joueur 7
      '#1c3d56',  # Joueur 8
      '#51cff2',  # Joueur 9
      '#561c23'   # Joueur 10
    ]
    # Itérer sur les joueurs et leurs runs
    players_runs.each_with_index do |(player_id, runs), index|
      color = colors[index % colors.length] # Réutiliser les couleurs si plus de 10 joueurs

      # Ajoutez un ou plusieurs runs pour ce joueur
      runs.each do |run|
        # Ajout des informations au tableau @layers
        @layers << {
          coordinates: run.coordinate_layer,  # Assurez-vous que run.coordinate_layer existe
          player_id: player_id,
          player_name: run.player.name || "Joueur inconnu",  # Nom du joueur
          color: color # Couleur associée
        }
      end
    end
  end
end
