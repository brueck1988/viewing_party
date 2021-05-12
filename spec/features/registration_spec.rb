require 'rails_helper'

RSpec.describe "Registration Page" do
  describe "When a user visits the registration page" do
    it "Registration page should include" do
      visit root_path

      click_link "New to Viewing Party? Register Here"

      expect(current_path).to eq(new_user_path)

      fill_in "user[email]", with: "bob@bob.com"
      fill_in "user[password]", with: "pw"
      fill_in "user[password_confirmation]", with: "pw"
      click_button "Register"

      new_user = User.last

      expect(current_path).to eq(dashboard_path(new_user.id))

      expect(page).to have_content("Welcome, bob@bob.com!")
    end
  end
end
