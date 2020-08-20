class SessionsController < ApplicationController
  def create
    access_data = request.env['omniauth.auth']
    user = User.parse_omniauth(access_data)
    user.google_token = access_data.credentials.token

    refresh_token = access_data.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?

    user.save

    session[:user_id] = user.id
    redirect_to root_path
  end
end