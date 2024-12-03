class GamesController < ApplicationController

  before_action :set_game, only: [:show, :edit, :update, :destroy, :update_runs]
  before_action :authorize_creator, only: [:edit, :update, :destroy]
  before_action :authorize_pending_game, only: [:edit, :update, :destroy]

  def show
    unless @game.status == 'pending' || @game.players.include?(current_player)
      redirect_to games_path, alert: 'You can not access this game, sorry ! '
    end
    # game_run_layers(@game)
    @layers = Games::ComputeRunsLayers.new(@game).call ## PLUS BESOIN?

    @comments = @game.comments.includes(:player) if @game.status == "ongoing"

    centroid = @game.polygone.centroid
    # Mets à disposition les coordonnées du centre du polygone pour la vue
    @centroid = { latitude: centroid.y, longitude: centroid.x }

    # @players_colors = @compute_runs_layers_service.players_colors
    @game_players = @game.game_players.includes(:player).order('ranking ASC')

      # Récupérer les couleurs des joueurs à partir des layers
    @players_colors = @layers.each_with_object({}) do |layer, hash|
      hash[layer[:player_id]] = layer[:color]
    end
    
  end

  def index
    @games = Game.where(status: 'pending').where.not(id: GamePlayer.where(player_id: current_player.id).select(:game_id))
    @games.each do |game|
      # Calcule le centre du polygone
      centroid = game.polygone.centroid
      # Mets à disposition les coordonnées du centre du polygone pour chaque jeu
      game.instance_variable_set(:@centroid, { latitude: centroid.y, longitude: centroid.x })
    end
  end

    # @games.each do |game|
    #   game_run_layers(game)
    # end


  def new
    @game = Game.new

    @map_polylines = Game::MAP_POLYLINES
  end


  def create
    # Récupération de la valeur sélectionnée du formulaire
    map_polyline_value = params[:game][:map_polyline]

    @game = Game.new(game_params.merge(map_polyline: map_polyline_value, status: "pending"))

    if @game.save
      @game.players << current_player
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end


  def update_runs
    Games::AssessRuns.new(game: @game).call
    redirect_to game_path(@game)
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
      # Calcule le centre du polygone
      centroid = game.polygone.centroid
      # Mets à disposition les coordonnées du centre du polygone pour chaque jeu
      game.instance_variable_set(:@centroid, { latitude: centroid.y, longitude: centroid.x })
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :nb_of_players, :duration, :map_polyline)
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
  # def game_run_layers(game)
  #   @layers = []
  #   assess_runs_service = Games::AssessRuns.new
  #   valid_runs = assess_runs_service.runs_valid_for_game(game.id)

  #   # Récupérer tous les joueurs du jeu et leurs runs valides
  #   # players_runs = game.runs.order(:end_datetime).group_by(&:player_id)
  #   runs = game.runs.order(:end_datetime)

  #   # Définir un tableau de couleurs prédéfinies
  #   colors = [
  #     '#a2922d', '#FF5964', '#38618C', '#35A7FF', '#ad72b3', '#61fab8',
  #     '#f29451', '#1c3d56', '#51cff2', '#561c23'
  #   ]

  #   players_colors = game.players.map.with_index do |player, index|
  #     { player.id => colors[index % colors.length] }
  #   end

  #   runs.each do |run|
  #     player_id = run.game_player.player_id
  #     color = players_colors[player_id]
  #     @layers << {
  #       coordinates: run.coordinate_layer,  # Assurez-vous que run.coordinate_layer existe
  #       player_id: player_id,
  #       player_name: run.player.name || "Joueur inconnu",  # Nom du joueur
  #       color: color # Couleur associée
  #     }
  #   end

  #   # Itérer sur les joueurs et leurs runs
  #   players_runs.each_with_index do |(player_id, runs), index|
  #     color = colors[index % colors.length] # Réutiliser les couleurs si plus de 10 joueurs

  #     # Ajoutez un ou plusieurs runs pour ce joueur
  #     runs.each do |run|
  #       # Ajout des informations au tableau @layers
  #       @layers << {
  #         coordinates: run.coordinate_layer,  # Assurez-vous que run.coordinate_layer existe
  #         player_id: player_id,
  #         player_name: run.player.name || "Joueur inconnu",  # Nom du joueur
  #         color: color # Couleur associée
  #       }
  #     end
  #   end
  #   # Assigner les layers calculés au jeu pour qu'ils soient accessibles dans la vue
  #   game.instance_variable_set(:@layers, @layers)
  # end
end
