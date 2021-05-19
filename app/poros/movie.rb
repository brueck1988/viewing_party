class Movie
  attr_reader :title,
              :id,
              :vote_average,
              :overview

  def initialize(data)
    @title = data[:title]
    @id = data[:id]
    @vote_average = data[:vote_average]
    @overview = data[:overview]
  end
end
