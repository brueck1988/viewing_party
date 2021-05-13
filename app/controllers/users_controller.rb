class UsersController < ApplicationController
  def index
    #look up find_or_create_by rails method
    @user = User.find_by(id: session[:user_id])
    @friend = User.find_by(email: params["friends_email"])
    binding.pry
    @user.friends << @new_friend
    # @user.requested_ids << @potential_friend
    #AR find all friendships with user_id
  end

  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:info] = "Welcome, #{new_user.email}!"
      redirect_to user_dashboard_index_path(new_user.id)
    else
      flash[:error] = new_user.errors
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
