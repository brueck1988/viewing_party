require 'rails_helper'

RSpec.describe "User dashboard" do
  before :each do
    @user1 = User.create!(name: "timmay", email: "timmay@tom.com", password: "Timmay")
    @user2 = User.create(name: "george", email: "george@appleseed.com", password: "21345" )
    visit root_path

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button("Log In")
  end

  describe "as an authenticated user when I visit '/dashboard'" do
    it "I should see" do

      expect(page).to have_content("Welcome, #{@user1.email}!")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Friends")
      expect(page).to have_field(:friends_email)
      expect(page).to have_button("Add Friend")
      expect(page).to have_content("Viewing Parties")
    end

    context "When I click on discover movies" do
      it "Takes me to a movies discover page" do
        click_button "Discover Movies"

        expect(current_path).to eq(discover_index_path)
        expect(page).to have_content("Welcome, #{@user1.email}!")
      end
    end
  end
end
