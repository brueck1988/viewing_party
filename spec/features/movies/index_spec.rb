require 'rails_helper'

RSpec.describe "Discover Page" do
  before :each do
    stub_top_20_page1
    stub_top_20_page2

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
      click_button("Find Top Rated Movies")
      expect(current_path).to eq(movies_path)
      list = find("#movies").all("li")
      expect(list.size).to eq(40)
    end

    xit 'I should see search field for movies' do

      expect(page).to have_field('Search By Title')
    end
  end
end
