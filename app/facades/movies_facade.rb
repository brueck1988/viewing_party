class MoviesFacade
  def self.top_forty_movies
    MovieService.top_movies.map { |movie_data| Movie.new(movie_data) }
  end

  def self.search(params)
    MovieService.search(params).map { |movie_data| Movie.new(movie_data) }
  end

  def self.movie(movie_id)
    Movie.new(MovieService.movie(movie_id))
  end

  def self.reviews(movie_id)
    MovieService.review(movie_id)
  end
end
