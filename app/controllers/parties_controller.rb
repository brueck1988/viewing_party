class PartiesController < ApplicationController
  def new
    @host = User.find_by(id: session[:user_id])
    @party = Party.new(movie_title: "Dark Phoenix", host: @host)
  end

  def create
    host = User.find_by(id: session[:user_id])
    party = Party.new(party_params)
    party.host = host
    if party.save
      attendee_ids = params[:party][:user_ids]
      attendee_ids.each { |i| party.users << User.find_by(id: i) } unless attendee_ids.nil?
      session[:welcome] = "Welcome, #{host.email}!"
      redirect_to user_dashboard_index_path(host.id)
    else
      flash[:error] = "Please Fill Out All Fields"
      redirect_to parties_new_path
    end
  end

  private

  def party_params
    params.require(:party).permit(:movie_title, :length, :date, :time)
  end
end
