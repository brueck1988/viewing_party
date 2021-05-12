require 'rails_helper'
require 'support/spec_test_helper.rb'

RSpec.describe "User dashboard" do
  before :each do
    @user = User.create!(email: "timmay@tom.com", password: "Timmay")

  end
  describe "as an authenticated user when I visit '/dashboard'" do
    it "I should see" do
      login(@user)
      visit user_dashboard_index_path(@user)

      expect(page).to have_content("Welcome, #{@user.email}!")
    end
  end
end
