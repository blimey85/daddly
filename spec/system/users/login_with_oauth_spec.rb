# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User logs in with oauth methods', type: :system, js: true do
  scenario 'login with Facebook', :aggregate_failures do
    login('Facebook', 'facebook@gmail.com')
  end

  scenario 'login with Google', :aggregate_failures do
    login('Google', 'google@gmail.com')
  end

  scenario 'login with Twitter', :aggregate_failures do
    login('Twitter', 'twitter@gmail.com')
  end
end

def login(site, email)
  # Visit home page
  visit root_path

  # Click button to sign up with given service
  click_link site

  expect(page).to have_content('You have to confirm your email address before continuing.')

  # Open email address confirmation email
  open_email(email)

  # Test that we received the email and it has the correct subject and message
  expect(current_email.subject).to eq('Confirmation instructions')
  expect(current_email).to have_content "Welcome #{email}!"

  # Click link to confirm email address
  current_email.click_link 'Confirm my account'

  # Test that the email address is confirmed and correct success message is present
  expect(page).to have_content 'Your email address has been successfully confirmed.'

  # Visit home page
  visit root_path

  # Click button to login with given service
  click_link site

  # Test that we have logged in and are being show the edit profile page
  expect(page).to have_content('Edit Your Profile')
end