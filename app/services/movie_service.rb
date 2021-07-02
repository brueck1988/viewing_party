class MovieService
  KEY = ENV['moviedb_api_key']

  attr_reader :conn

  def initialize
    @conn = Faraday.new('https://api.themoviedb.org/')
  end

  def top_40_movies_page_1
    resp = conn.get('3/movie/top_rated') do |req|
      req.params[:api_key] = KEY
      req.params[:language] = 'en-US'
      req.params[:include_adult] = false
    end
    JSON.parse(resp.body, symbolize_names: true)[:results]
  end

  def top_40_movies_page_2
    resp = conn.get('3/movie/top_rated') do |req|
      req.params[:api_key] = KEY
      req.params[:language] = 'en-US'
      req.params[:include_adult] = false
      req.params[:page] = 2
    end
    JSON.parse(resp.body, symbolize_names: true)[:results]
  end

  def top_40_movies
    top_40_movies_page_1 + top_40_movies_page_2
  end

  def self.search_results_1(string_query)
    movies = Faraday.get(
      "https://api.themoviedb.org/3/search/movie",
      {
        api_key: ENV['moviedb_api_key'],
        query: string_query,
        language: 'en-US',
        include_adult: false
        })
    JSON.parse(movies.body, symbolize_names: true)[:results]
  end

  def self.search_results_2(string_query)
    movies = Faraday.get(
      "https://api.themoviedb.org/3/search/movie",
      {
        api_key: ENV['moviedb_api_key'],
        query: string_query,
        language: 'en-US',
        include_adult: false,
        page: 2
        })
    JSON.parse(movies.body, symbolize_names: true)[:results]
  end

  def self.search_by_name(string_query)
    search_results_1(string_query) + search_results_2(string_query)
  end

  def self.movie_with_reviews(movie_id)
    movie_and_reviews = Faraday.get(
      "https://api.themoviedb.org/3/movie/#{movie_id}",
      {
        api_key: ENV['moviedb_api_key'],
        append_to_response: 'reviews'
        })
    JSON.parse(movie_and_reviews.body, symbolize_names: true)
  end

  def self.movie_credits(movie_id)
    credits = Faraday.get(
      "https://api.themoviedb.org/3/movie/#{movie_id}/credits",
      {
        api_key: ENV['moviedb_api_key']
      }
    )
    JSON.parse(credits.body, symbolize_names: true)
  end
end
