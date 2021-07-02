class Movie
  attr_reader :json, :cast_json

  def initialize(json_from_api, cast= nil)
    @json = json_from_api
    @cast_json = cast
  end

  def title
    json[:title]
  end

  def id
    json[:id]
  end

  def vote_average
    json[:vote_average]
  end

  def overview
    json[:overview]
  end

  def cast
    cast_json[:cast].first(10).map { |actor| actor[:name] }
  end

  def genres
    json[:genres].map { |genre| genre[:name] }.join(', ')
  end

  def runtime
    json[:runtime]
  end

  def reviews
    json[:reviews][:results].map { |review| Review.new(review)}
  end
end
