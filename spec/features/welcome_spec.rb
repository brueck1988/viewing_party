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
end
