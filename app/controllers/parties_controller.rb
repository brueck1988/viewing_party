class PartiesController < ApplicationController
  def new
    @host = User.find_by(id: session[:user_id])
    session[:welcome] = "Welcome #{@host.email}!"
    @runtime = params[:runtime].to_i
    @party = Party.new(new_party_params)
  end

  def create
    @host = User.find_by(id: session[:user_id])
    @party = Party.new(party_params)
    @party.host = @host
    if @party.save
      attendee_ids = params[:party][:user_ids]
      attendee_ids.each { |i| @party.users << User.find_by(id: i) } unless attendee_ids.nil?
      session[:welcome] = "Welcome, #{@host.email}!"
      redirect_to user_dashboard_index_path(@host.id)
    else
      @runtime = params[:party][:runtime].to_i
      flash[:error] = 'Please Fill Out All Fields'
      session[:welcome] = "Welcome, #{@host.email}!"
      render 'new'
    end
  end

  private

  def party_params
    params.require(:party).permit(:movie_title, :movie_id, :length, :date, :time, :runtime)
  end

  def new_party_params
    params.permit(:movie_title, :movie_id, :runtime)
  end
end
