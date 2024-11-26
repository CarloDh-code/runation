require 'net/http'
require 'json'
class StravaAuthController < ApplicationController
  # Step 1: Redirect user to Strava's authorization page
  def redirect
    # strava_url = "https://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_CLIENT_ID']}&response_type=code&redirect_uri=#{callback_url}&approval_prompt=force&scope=activity:read_all"
    # strava_url = "https://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_CLIENT_ID']}" \
    #              "&response_type=code&redirect_uri=#{callback_url}" \
    #              "&scope=read,activity:read&approval_prompt=auto"
    #
    # strava_url = 'https://www.strava.com/oauth/authorize?client_id=140985&response_type=code&redirect_uri=http://localhost:3000/auth/strava/callback&approval_prompt=force&scope=activity:read_all'

    strava_url = "https://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_CLIENT_ID']}&response_type=code&redirect_uri=http://#{callback_url}&approval_prompt=force&scope=activity:read_all"
    p strava_url

    # strava_url = "https://www.strava.com/oauth/authorize?client_id=#{ENV['STRAVA_CLIENT_ID']}&response_type=code&redirect_uri=http://localhost:3000/auth/strava/callback&approval_prompt=force&scope=activity:read_all"

    redirect_to strava_url, allow_other_host: true
  end
  # Step 2: Handle callback from Strava
  def callback
    code = params[:code] # Extract authorization code from query parameters
    if code.present?
      tokens = exchange_code_for_tokens(code) # Exchange the code for tokens
      puts tokens
      if tokens['access_token']
        current_player.update(
          token: tokens['access_token'],
          refresh_token: tokens['refresh_token'],
          uid: tokens['athlete']['id']
        )
       redirect_to root_path, notice: 'Strava account connected successfully!'
      else
        flash[:alert] = 'Failed to retrieve tokens from Strava. Please try again.'
        redirect_to root_path
      end
    else
      flash[:alert] = 'No authorization. Please try again.'
      redirect_to root_path
    end
  end
  private
  # Callback URL for your app
  def callback_url
    "localhost:3000/auth/strava/callback"
  end
  # Exchange the authorization code for an access token and refresh token
  def exchange_code_for_tokens(code)
    uri = URI('https://www.strava.com/oauth/token')
    response = Net::HTTP.post_form(uri, {
      client_id: ENV['STRAVA_CLIENT_ID'],
      client_secret: ENV['STRAVA_CLIENT_SECRET'],
      code: code,
      grant_type: 'authorization_code'
    })
    JSON.parse(response.body)
  end
end
