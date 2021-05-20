class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :overview,
              :cast,
              :genres,
              :runtime

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @overview = data[:overview]
    if data[:credits].nil?
      @cast
      @genres
      @runtime
    else
      @cast = data[:credits][:cast].first(10).map { |c| c[:name] }
      @genres = data[:genres].map { |g| g[:name] }.join(', ')
      @runtime = data[:runtime]
    end
  end
end
