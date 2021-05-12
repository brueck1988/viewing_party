class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome, #{user.email}!"
      redirect_to dashboard_path(user.id)
    else
      flash[:error] = "Your email or password are incorrect"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
