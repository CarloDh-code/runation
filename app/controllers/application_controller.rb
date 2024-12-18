class ApplicationController < ActionController::Base
  before_action :authenticate_player!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :home_page?

  def home_page?
    controller_name == "pages" && action_name == "home"
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :nickname])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :nickname])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end


end
