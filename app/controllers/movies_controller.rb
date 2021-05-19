class MoviesController < ApplicationController
  def index
    if params[:search].nil? || params[:search] == ''
      top_forty
    else
      search
    end
  end

  def top_forty
    @movies_info = MoviesFacade.top_forty_movies
  end

  def search
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-KEY'] = ENV['moviedb_api_key']
    end
    response_1 = conn.get("/3/search/movie?api_key=#{ENV['moviedb_api_key']}&language=en-US&query=#{params[:search]}&include_adult=false&page=1")
    response_2 = conn.get("/3/search/movie?api_key=#{ENV['moviedb_api_key']}&language=en-US&query=#{params[:search]}&include_adult=false&page=2")
    movies_info_1 = JSON.parse(response_1.body, symbolize_names: true)[:results]
    movies_info_2 = JSON.parse(response_2.body, symbolize_names: true)[:results]
    @movies_info = movies_info_1 + movies_info_2
  end

  def show
    user = User.find(session[:user_id])
    flash[:info] = "Welcome, #{user.email}!"

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-KEY'] = ENV['moviedb_api_key']
    end
    movie_response = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['moviedb_api_key']}&language=en-US&include_adult=false&append_to_response=credits")
    reviews_response = conn.get("/3/movie/#{params[:id]}/reviews?api_key=#{ENV['moviedb_api_key']}&language=en-US&include_adult=false")

    @movie_info = JSON.parse(movie_response.body, symbolize_names: true)
    @genres = @movie_info[:genres].map { |g| g[:name] }.join(', ')
    @cast = @movie_info[:credits][:cast].first(10).map { |c| c[:name] }
    @movie_reviews = JSON.parse(reviews_response.body, symbolize_names: true)[:results]
  end
end
