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

  describe "when I visit '/discover'" do
    it "I should see" do

      expect(page).to have_content("Welcome, #{@user1.email}!")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Friends")
      expect(page).to have_field(:friends_email)
      expect(page).to have_button("Add Friend")
      expect(page).to have_content("Viewing Parties")
    end
    
    context "When I search for a friends email" do
      it "HAPPY PATH - I add friend by email successfully" do
        within ".friends" do
          expect(page).to_not have_content(@user2.name)
          fill_in :friends_email, with: @user2.email
          click_on "Add Friend"
          expect(page).to have_content(@user2.name)
        end
      end
      
      it "I see that I have no friends" do
        within ".friends" do
          expect(page).to have_content("You currently have no friends.")
        end
      end
      
      it "SAD PATH - I add friend by email unsuccessfully" do
        within ".friends" do
          expect(page).to have_content("You currently have no friends.")
          fill_in :friends_email, with: "daffy_duck@gmail.com"
          click_on "Add Friend"
          expect(page).to have_content("daffy_duck@gmail.com doesn't exist")
        end
      end
    end
  end
end