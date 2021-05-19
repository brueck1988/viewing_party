require 'rails_helper'

RSpec.describe "Movie Show Page" do
  before :each do
    @user1 = User.create!(name: "timmay", email: "timmay@tom.com", password: "Timmay")
    visit root_path

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button("Log In")
    click_button "Discover Movies"
  end

  describe "when I visit the movie show page", :vcr do
    it "I should see the movie's details" do
      click_button "Find Top Rated Movies"
      click_link "Parasite"
      expect(page).to have_content("Welcome, #{@user1.email}!")
      expect(page).to have_content("Parasite")
      expect(page).to have_content("Vote Average:")
      expect(page).to have_content("Runtime:")
      expect(page).to have_content("Genre:")
      expect(page).to have_content("Cast")
      expect(page).to have_content("Summary")
      expect(page).to have_content("Reviews")
    end
  end
end
