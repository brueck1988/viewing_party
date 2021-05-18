class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: session[:user_id])
    if (@friend = User.find_by(email: params['friends_email']))
      friendship = Friendship.new(user_id: @user.id, friend_id: @friend.id)
      if friendship.save
        flash[:notice] = "#{@friend.name} has been added"
      else
        flash[:error] = "Check Your Entry" 
      end
    else
      flash[:error] = "#{params['friends_email']} doesn't exist"
    end
    redirect_to user_dashboard_index_path(@user.id)
  end

end
