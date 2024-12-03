class PagesController < ApplicationController
  skip_before_action :authenticate_player!, only: [ :home ]

  def home
    @player = current_player if player_signed_in?
  end
end
