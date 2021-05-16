class PartiesController < ApplicationController
  def new
    @host = User.find_by(id: session[:user_id])
    @party = Party.new(movie_title: "Dark Phoenix", host: @host)
  end

  def create

  end
end
