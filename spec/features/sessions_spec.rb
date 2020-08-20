require 'rails_helper'

RSpec.describe 'Sessions spec', type: :feature do
  it 'logs the user in via google mock' do
    stub_omniauth
    user = create(:user, username: 'john@example.com')

    visit root_path

    click_link 'Log in with Google'

    expect(page).to have_content("Welcome back, #{user.username}")
  end
end