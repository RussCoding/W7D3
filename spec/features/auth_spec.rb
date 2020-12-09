require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end
  feature 'signing up a user' do
    before(:each) do
        visit new_user_url
        fill_in "username", :with => "techiesmain"
        fill_in "password", :with => "password1"
        click_on "Create Account"
    end
    scenario 'shows username on the homepage after signup' do
        expect(page).to have_content "techiesmain"
    end
  end
end

feature 'logging in' do
    before(:each) do
        visit new_session_url
        fill_in "username", :with => "techiesmain"
        fill_in "password", :with => "password1"
        click_on "Log in"
    end
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content "techiesmain"
  end
end

feature 'logging out' do
    scenario 'begins with a logged out state' do

    end

    scenario 'doesn\'t show username on the homepage after logout' do
    end
  
end