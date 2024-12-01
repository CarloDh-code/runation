class GamesController < ApplicationController
  before_action :set_game, only: [:show]


  def show
    unless @game.status == 'pending' || @game.players.include?(current_player)
      redirect_to games_path, alert: 'You can not access this game, sorry ! '
    end
    game_run_layers

    @comments = @game.comments.includes(:player) if @game.status == "ongoing"
    # @polylines = @game.runs.includes(:polyline)
    # @player_colors = {
    #   @players[0].id => '#a2922d',
    #   @players[1].id => '#FF5964',
    #   @players[2].id => '#38618C',
    #   @players[3].id => '#35A7FF'
    # }.to_json
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
    @game.runs.each do |run|
      @layers << run.coordinate_layer
    end
  end

end
