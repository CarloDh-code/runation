class GamesController < ApplicationController

  def show
       unless @game.status == 'pending' || @game.players.include?(current_user)
        redirect_to games_path, alert: 'You can not access this game, sorry ! '
       end
  end

end
