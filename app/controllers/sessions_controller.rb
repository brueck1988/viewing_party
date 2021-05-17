class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:welcome] = "Welcome, #{user.email}!"
      redirect_to user_dashboard_index_path(user.id)
    else
      flash[:error] = 'Your email or password are incorrect'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
