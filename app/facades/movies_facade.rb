class MoviesFacade
  def self.top_forty_movies
    MovieService.new.top_40_movies.map { |movie_data| Movie.new(movie_data) }
  end

  def self.search_for_a_movie(string_query)
    MovieService.search_by_name(string_query).map { |json| Movie.new(json) }
  end

  def self.movie_by_id(movie_id)
    cast_json = MovieService.movie_credits(movie_id)
    json = MovieService.movie_with_reviews(movie_id)
    Movie.new(json, cast_json)
  end
end
