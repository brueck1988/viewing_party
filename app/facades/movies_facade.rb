class MoviesFacade
  def self.top_forty_movies
    json = MovieService.top_movies
    json.map { |movie_data| Movie.new(movie_data) }
  end
end
