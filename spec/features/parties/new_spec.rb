require 'rails_helper'

RSpec.describe "New viewing party page" do
  #before test establish movie and host and hosts friends
  before :each do
    @host = User.create(name: "ryan", email: "ryan@ryan.com", password: "ryan")
    @party = Party.new(movie_title: "Dark Phoenix", host: @host)

    visit parties_new_path
    fill_in :email, with: @host.email
    fill_in :password, with: @host.password
    click_button("Log In")
  end
  it "HAPPY PATH: I can create a new party!" do
    visit parties_new_path

    expect(page).to have_content("Welcome #{@party.host.email}!")
    expect(page).to have_content(@party.movie_title)
    
    fill_in "Duration of Party", with: 180
    fill_in "Day", with: "2021-12-21"
    fill_in "Start Time", with: "1:00"

    check_box "jill"

    click_on "Create Party"
  end
end
