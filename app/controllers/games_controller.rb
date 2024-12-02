class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authorize_creator, only: [:edit, :update, :destroy]
  before_action :authorize_pending_game, only: [:edit, :update, :destroy]


  def show
    unless @game.status == 'pending' || @game.players.include?(current_player)
      redirect_to games_path, alert: 'You can not access this game, sorry ! '
    end
    game_run_layers(@game)

    @comments = @game.comments.includes(:player) if @game.status == "ongoing"
  end

  def index
    @games = Game.where(status: 'pending').includes(:players).reject do |game|
      game.players.include?(current_player)
    end

    @games.each do |game|
      game_run_layers(game)
    end
  end


  def new
    @game = Game.new

    @map_polylines = Game::MAP_POLYLINES
  end

  def create
    @game = Game.new(game_params)
    @game.status = "pending"
    @game.game_players.new(player: current_player)
    @map_polylines = Game::MAP_POLYLINES
    if @game.save
      redirect_to @game, notice: "Game successfully created"
    else
      render :new
    end
  end

  def edit
    @map_polylines = Game::MAP_POLYLINES
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game successfully updated"
    else
      @map_polylines = Game::MAP_POLYLINES
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
    redirect_to mine_games_path, notice: "Game successfully deleted"
  end




  def mine
    @games = current_player.games.order(end_date: :desc)
    @games.each do |game|
      # Appel de la méthode pour obtenir les layers de ce jeu
      game_run_layers(game)
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :nb_of_players, :start_date, :duration)
  end

  def authorize_creator
    unless @game.game_players.first.player == current_player
      redirect_to games_path, alert: "You are not authorized to perform this action."
    end
  end

  def authorize_pending_game
    unless @game.status == "pending"
      redirect_to games_path, alert: "You can only modify or delete games that are pending."
    end
  end

    # Modification de la méthode game_run_layers pour accepter un argument `game`
  def game_run_layers(game)
    @layers = []
    assess_runs_service = Games::AssessRuns.new
    valid_runs = assess_runs_service.runs_valid_for_game(game.id)

    # Récupérer tous les joueurs du jeu et leurs runs valides
    players_runs = game.runs.group_by(&:player_id)

    # Définir un tableau de couleurs prédéfinies
    colors = [
      '#a2922d', '#FF5964', '#38618C', '#35A7FF', '#ad72b3', '#61fab8',
      '#f29451', '#1c3d56', '#51cff2', '#561c23'
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
    # Assigner les layers calculés au jeu pour qu'ils soient accessibles dans la vue
    game.instance_variable_set(:@layers, @layers)
  end
end
