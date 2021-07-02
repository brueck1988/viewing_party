require 'rails_helper'

RSpec.describe Review do
  before :each do
    input = {
      :author=>"John Chard",
      :author_details=>{:name=>"", :username=>"John Chard", :avatar_path=>"/utEXl2EDiXBK6f41wCLsvprvMg4.jpg", :rating=>9.0},
      :content=> "Raiders Of The Last Crusade. Indiana Jones teams up with his father to try and locate the Holy Grail.",
      :created_at=>"2015-12-27T23:32:36.929Z",
      :id=>"56807514c3a3682abc0072da",
      :updated_at=>"2021-06-23T15:57:41.982Z",
      :url=>"https://www.themoviedb.org/review/56807514c3a3682abc0072da"
    }
    @review = Review.new(input)
  end
  describe "instance variables" do
    it "has an author" do
      expect(@review.author).to eq("John Chard")
    end
    
    it "has an review/content" do
      expect(@review.content).to eq("Raiders Of The Last Crusade. Indiana Jones teams up with his father to try and locate the Holy Grail.")
    end
  end
end
