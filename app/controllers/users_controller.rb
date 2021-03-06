class UsersController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      session[:welcome] = "Welcome, #{new_user.email}!"
      redirect_to user_dashboard_index_path(new_user.id)
    else
      flash[:error] = "Please fill out all fields"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
