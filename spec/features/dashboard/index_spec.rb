require 'rails_helper'

RSpec.describe "User dashboard" do
  before :each do
    @user1 = User.create!(name: "timmay", email: "timmay@tom.com", password: "Timmay")
    @user2 = User.create!(name: "george", email: "george@appleseed.com", password: "21345" )
    @party = Party.create!(host_id: @user1.id, movie_id: 496243, movie_title: "Parasite", runtime: 133, length: 145, date: "06/11/2021", time: "1:00")
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
      end
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

      it "SAD PATH - I add friend who has already been added" do
        within ".friends" do
          expect(page).to have_content("You currently have no friends.")
          fill_in :friends_email, with: @user2.email
          click_on "Add Friend"
          expect(page).to have_content(@user2.name)
          fill_in :friends_email, with: @user2.email
          click_on "Add Friend"
          expect(page).to have_content("Check Your Entry" )
        end
      end
    end

    context "When I click the link for a movie I am hosting or invited to" do
      it "Goes to the Movies show page" do
        stub_movie_496243
        stub_review_496243

        within ".hosting" do
          expect(page).to have_content(@party.movie_title)
          click_link "Parasite"
          expect(current_path).to eq(movie_path(@party.movie_id))
        end
      end
    end
  end
end
