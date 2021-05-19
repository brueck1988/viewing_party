class MovieService

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-KEY'] = ENV['moviedb_api_key']
    end
  end

  def self.top_movies
    movies_info_1 = parse(conn.get("/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}&language=en-US&include_adult=false&page=1"))
    movies_info_2 = parse(conn.get("/3/movie/top_rated?api_key=#{ENV['moviedb_api_key']}&language=en-US&include_adult=false&page=2"))
    movies_info_1 + movies_info_2
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end


end
