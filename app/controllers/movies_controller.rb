class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['moviedb_api_key']
    end
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}&language=en-US")
    @movies_info = JSON.parse(response.body, symbolize_names: true)[:results]
    #require "pry";binding.pry
    render "discover/index"
  end
  
  def show
    user = User.find(session[:user_id])
    flash[:info] = "Welcome, #{user.email}!"
    
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['moviedb_api_key']
    end
    movie_response = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['moviedb_api_key']}&language=en-US")
    reviews_response = conn.get("/3/movie/#{params[:id]}/reviews?api_key=#{ENV['moviedb_api_key']}&language=en-US")
    @movie_info = JSON.parse(movie_response.body, symbolize_names: true)
    @movie_reviews = JSON.parse(reviews_response.body, symbolize_names: true)[:results]
  end
end