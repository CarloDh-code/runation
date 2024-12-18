class ProfilesController < ApplicationController
  # before_action :authenticate_player!

  def show
    @player = current_player
    @user_real_name = current_player.name
    @username = current_player.nickname
    @usermail = current_player.email
    @games_played_count = current_player.games.where(status: 'finish').count
    @games_won_count = current_player.game_players.joins(:game).where(ranking: 1).where(games: {status: "finish"}).count
    @previous_games = current_player.games.where(status: "finish").order(end_date: :desc)
    @ongoing_games = current_player.games.where(status: "ongoing").order(end_date: :desc)
    @km_covered =
    # @distance_covered = current_player.runs
    @upcoming_games_count = current_player.games.where(status: "pending").count
  end

  # def edit
  #   # Prépare l'objet joueur pour le formulaire
  #   @player = current_player
  # end

  # def update
  #   if params[:photo]
  #     current_player.update(photo: params[:photo])
  #     redirect_to profile_path, notice: "Photo mise à jour avec succès."
  #   else
  #     redirect_to edit_profile_path, alert: "Erreur lors de l'upload."
  #   end
  # end
end
