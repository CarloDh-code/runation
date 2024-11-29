class PagesController < ApplicationController
  # skip_before_action :authenticate_player!, only: [ :home ]

  class PagesController < ApplicationController
    def home
      if player_signed_in?
        respond_to do |format|
          format.html
          format.js { render js: "setTimeout(function(){ window.location.href='#{games_path}'; }, 4000);" }
        end
      else
        redirect_to new_player_session_path, alert: "Please log in to access the application."
      end
    end
  end


end
