class DiscoverController < ApplicationController
  def index
    user = User.find(session[:user_id])
    session[:welcome] = "Welcome, #{user.email}!"
  end
end
