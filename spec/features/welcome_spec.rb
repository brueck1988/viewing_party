require 'rails_helper'

RSpec.describe 'Welcome page', type: :feature do
  it 'shows a welcome page' do
    visit root_path

    expect(page).to have_content('Welcome to the Viewing Party!')
  end
  it 'shows a login-with-google button for non-session users' do
    visit root_path

    expect(page).to have_link('Log in with Google')
  end
  it 'shows a welcome back message to session users' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Welcome back, #{user.username}")
  end
end