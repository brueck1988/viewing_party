require 'rails_helper'

RSpec.describe "New viewing party page", :vcr do
  before :each do
    @host = User.create(name: "ryan", email: "ryan@ryan.com", password: "ryan")
    @friend_1 = User.create(name: "fr_1", email: "ab@foodnetwork.com", password: "ab")
    @friend_2 = User.create(name: "fr_2", email: "f2@foodnetwork.com", password: "ab")
    @friend_3 = User.create(name: "fr_3", email: "f3@foodnetwork.com", password: "ab")
    @host.friends << [@friend_1, @friend_3]
    @party = Party.new(movie_title: "Parasite", host: @host)

    visit root_path
    fill_in :email, with: @host.email
    fill_in :password, with: @host.password
    click_button("Log In")
    click_button "Discover Movies"
    click_button "Find Top Rated Movies"
    click_link "Parasite"
    click_button "Create Viewing Party For Movie"
  end

  it "SAD PATH: I cannot submit a duration shorter than movie run time" do
    expect(page).to have_content("Welcome #{@party.host.email}!")
    expect(page).to have_content(@party.movie_title)

    fill_in "party[length]", with: 5
    fill_in "party[date]", with: "06/11/2021"
    fill_in "party[time]", with: "1:00"

    click_on "Create Party"

    expect(current_path).to eq("/parties/create")
    expect(page).to have_content("Please Fill Out All Fields")
  end

  it "SAD PATH: I get error messages when I don't fill out all fields" do
    expect(page).to have_content("Welcome #{@party.host.email}!")
    expect(page).to have_content(@party.movie_title)

    fill_in "party[length]", with: ""
    fill_in "party[date]", with: "06/11/2021"
    fill_in "party[time]", with: "1:00"

    click_on "Create Party"

    expect(current_path).to eq("/parties/create")
    expect(page).to have_content("Please Fill Out All Fields")
  end

  it "HAPPY PATH: I can create a new party!" do
    expect(page).to have_content("Welcome #{@party.host.email}!")
    expect(page).to have_content(@party.movie_title)

    fill_in "party[length]", with: 180
    fill_in "party[date]", with: "06/11/2021"
    fill_in "party[time]", with: "1:00"

    within "#friend-#{@friend_1.id}" do
      check "party[user_ids][]"
    end
    within "#friend-#{@friend_3.id}" do
      check "party[user_ids][]"
    end

    click_on "Create Party"

    expect(current_path).to eq(user_dashboard_index_path(@host.id))

    within ".hosting" do
      expect(page).to have_content("Parasite")
      expect(page).to have_content("November 06, 2021")
      expect(page).to have_content("01:00")
      expect(page).to have_content("Hosting!")
      expect(page).to have_content("fr_1")
      expect(page).to have_content("fr_3")
    end

    visit user_dashboard_index_path(@friend_1.id)
    within ".invited" do
      expect(page).to have_content("Parasite")
      expect(page).to have_content("November 06, 2021")
      expect(page).to have_content("01:00")
      expect(page).to have_content("Invited!")
    end
  end
end
