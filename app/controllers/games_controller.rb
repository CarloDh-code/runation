class GamesController < ApplicationController
  before_action :set_game, only: [:show]


  def show
       unless @game.status == 'pending' || @game.players.include?(current_user)
        redirect_to games_path, alert: 'You can not access this game, sorry ! '
       end
  end

  def index
    @games = Game.where(status: 'pending')
    game_player_ids = GamePlayer.where(game_id: @games.pluck(:id)).pluck(:id)
    @runs = Run.joins(:game_player_runs).where(game_player_runs: { game_player_id: game_player_ids })

    @markers = @runs.map do |run|
      decoded_path = run.decoded_path
      if decoded_path.present?
        { lat: decoded_path.first[0], lng: decoded_path.first[1] }
      end
    end.compact

  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.status = "pending"
    @game.game_players.new(player: current_player)

    if @game.save
      redirect_to @game, notice: "game successfully created"
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
    params.require(:game).permit(:name, :nb_of_players, :start_date, :end_date)
  end
end
