class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: session[:user_id])

    if (@friend = User.find_by(email: params['friends_email']))
      @user.friends << @friend
      redirect_to user_dashboard_index_path(@user.id)
      # render "dashboard/index"
    else
      flash[:error] = "#{params['friends_email']} doesn't exist"
      redirect_to user_dashboard_index_path(@user.id)
    end
  end

end
