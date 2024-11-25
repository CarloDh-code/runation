class PagesController < ApplicationController
  skip_before_action :authenticate_player!, only: [ :home ]

  def home
  end
end
