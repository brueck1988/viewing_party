class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  private

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to root_path, notice: 'Please Log In'
    end
  end
end
