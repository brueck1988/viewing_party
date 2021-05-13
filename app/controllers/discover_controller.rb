class DiscoverController < ApplicationController
  def index
    user = User.find(session[:user_id])
    flash[:info] = "Welcome, #{user.email}!"
  end
end
