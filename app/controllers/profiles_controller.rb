class ProfilesController < ApplicationController
  def show
    @user_real_name = current_player.name
    @username = current_player.nickname
    @usermail = current_player.email
    @games_played_count = current_player.games.count
    @games_won_count = current_player.game_players.joins(:game).where(ranking: 1).where(games: {status: "finish"}).count
    @previous_games = current_player.games.where(status: "finish").order(end_date: :desc)
    @ongoing_games = current_player.games.where(status: "ongoing").order(end_date: :desc)
    # @distance_covered = current_player.runs
    @upcoming_games_count = current_player.games.where(status: "pending").count
  end
end
