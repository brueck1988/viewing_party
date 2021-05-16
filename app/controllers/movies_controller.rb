class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['moviedb_api_key']
    end
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}&language=en-US")
    @movies_info = JSON.parse(response.body, symbolize_names: true)
  end
end