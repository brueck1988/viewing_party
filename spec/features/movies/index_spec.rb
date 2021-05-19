require 'rails_helper'

RSpec.describe "Discover Page" do
  before :each do
    @user1 = User.create!(name: "timmay", email: "timmay@tom.com", password: "Timmay")
    @user2 = User.create(name: "george", email: "george@appleseed.com", password: "21345" )
    visit root_path

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button("Log In")
    click_button "Discover Movies"
  end

  describe "when I visit '/movies" do
    it "I should see button 'Find Top Rated Movies" do
      VCR.use_cassette('Button to find top Rated Movies') do    
        click_button("Find Top Rated Movies")
        expect(current_path).to eq(movies_path)
        list = find("#movies").all("li")
        expect(list.size).to eq(40)
      end
    end

    it 'I should see search field for movies' do
      VCR.use_cassette('Search for Indiana Jones') do    
        expect(page).to have_field('Search By Title')
        fill_in "Search By Title", with: "Indiana Jones"
        click_on "Search By Title"
        list = find("#movies").all("li")
        expect(list.size).to eq(40)
      end
    end
  end
end
