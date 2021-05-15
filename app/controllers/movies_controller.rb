class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['movies_api_key']
    end
    require "pry";binding.pry
    response = conn.get("/movie/top_rated")
    
    data = JSON.parse(response.body, symbolize_names: true)
    # 
    # members = data[:results][0][:members]
    # 
    # found_members = members.find_all {|m| m[:last_name] == params[:search]}
    # @member = found_members.first
    
    # redirect_to discover_index_path
  end
end
