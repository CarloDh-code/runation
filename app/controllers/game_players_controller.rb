class GamePlayersController < ApplicationController
  before_action :set_game, only: [:create]

  def create
    @game = Game.find(params[:game_id])
    if @game.players.include?(current_player)
      redirect_to @game, alert: 'Vous êtes déjà inscrit à ce jeu.'
    else
      game_player = @game.game_players.create(player: current_player)
      if game_player.persisted?
        @game.check_and_update_status!
        redirect_to @game, notice: 'Vous avez rejoint la partie avec succès.'
      else
        redirect_to @game, alert: 'Une erreur est survenue lors de la tentative de rejoindre la partie.'
      end
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def already_registered?
    @game.players.include?(current_player)
  end
end
