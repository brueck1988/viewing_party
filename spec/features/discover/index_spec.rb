require 'rails_helper'

RSpec.describe "Discover Page" do
  before :each do
    stub_top_20_page1
    stub_top_20_page2

    @user1 = User.create!(name: 'timmay', email: 'timmay@tom.com', password: 'Timmay')
    @user2 = User.create!(name: 'george', email: 'george@appleseed.com', password: '21345' )
    visit root_path

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button('Log In')
    click_button 'Discover Movies'
  end

  describe 'when I visit discover' do
    it 'I should see button Find Top Rated Movies' do
      click_button('Find Top Rated Movies')
      expect(current_path).to eq(movies_path)
    end

    it 'I should see search field for movies' do
      json_response_search_1 = File.read('spec/fixtures/search_page_1.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['moviedb_api_key']}&include_adult=false&language=en-US&page=1&query=Indiana%20Jones").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.4.1',
     'X-Api-Key'=>'477ddf3c5e2f8973bf7c8405d75b2acb'
      }).
    to_return(status: 200, body: json_response_search_1, headers: {})

    json_response_search_2 = File.read('spec/fixtures/search_page_2.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['moviedb_api_key']}=Indiana%20Jones").
  with(
    headers: {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'User-Agent'=>'Faraday v1.4.1',
   'X-Api-Key'=>'477ddf3c5e2f8973bf7c8405d75b2acb'
    }).
  to_return(status: 200, body: json_response_search_2, headers: {})



      expect(page).to have_field('Search By Title')
      fill_in "Search By Title", with: "Indiana Jones"
      click_on "Search By Title"
      expect(current_path).to eq(movies_path)
      expect(page).to have_content("Indiana Jones")
      click_on "Indiana Jones and the Last Crusade"
      expect(current_path).to eq(movie_path(89))
    end

  end
end
