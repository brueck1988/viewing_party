class MoviesController < ApplicationController
  def index
    if params[:search].nil? || params[:search] == ''
      @movies_info = MoviesFacade.top_forty_movies
    else
      @movies_info = MoviesFacade.search(params[:search])
    end
  end

  def show
    user = User.find(session[:user_id])
    flash[:info] = "Welcome, #{user.email}!"

    @movie_info = MoviesFacade.movie(params[:id])
    @movie_reviews = MoviesFacade.reviews(params[:id])
  end
end
