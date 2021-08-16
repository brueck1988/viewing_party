class Review
  attr_reader :author, :content

  def initialize(input)
    @author = input[:author]
    @content = input[:content]
  end
end
