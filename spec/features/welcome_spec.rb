require 'rails_helper'

RSpec.describe "Welcome page" do
  describe "when a user visits the root path" do
    it "Welcome page should include" do
      visit root_path

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("Brief Description of the Application")
      expect(page).to have_button("Log In")
      expect(page).to have_link("New to Viewing Party? Register Here")
    end
  end

  describe "logging in" do
    it "As a registered user I can login with correct credentials" do
      user = User.create(email: "john@appleseed.com", password: "12345" )

      visit root_path

      fill_in :email, with: "john@appleseed.com"
      fill_in :password, with: "12345"

      click_button("Log In")

      expect(current_path).to eq(user_dashboard_index_path(user.id))
      expect(page).to have_content("Welcome, john@appleseed.com!")
      expect(page).to_not have_link("I already have an account")
      expect(page).to_not have_link("Sign up to be a user")
      expect(page).to have_link("Log Out")

      click_link("Log Out")

      expect(current_path).to eq(root_path)
      expect(page).to_not have_link("Log Out")
      expect(page).to have_link("New to Viewing Party? Register Here")
    end

    it "As a registered user, I can't log in with incorrect credentials" do
      user = User.create(email: "john@appleseed.com", password: "12345" )

      visit root_path

      fill_in :email, with: "john@appleseed.com"
      fill_in :password, with: "123456"

      click_button("Log In")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Your email or password are incorrect")
    end
  end
end
