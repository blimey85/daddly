# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User signs Up', type: :system, js: true do
  # Build stubbed user
  let!(:new_user) { FactoryBot.build_stubbed(:user) }

  scenario 'open confirmation email', :aggregate_failures do
    # Open home page
    visit root_path

    # Complete sign up form
    fill_in 'user[email]', with: new_user.email
    fill_in 'user[password]', with: new_user.password
    fill_in 'user[password_confirmation]', with: new_user.password

    # Submit sign up form
    click_button 'Create Account'

    # Open email address confirmation email
    open_email(new_user.email)

    # Test that we received the email and it has the correct subject and message
    expect(current_email.subject).to eq('Confirmation instructions')
    expect(current_email).to have_content "Welcome #{new_user.email}!"

    # Click link to confirm email address
    current_email.click_link 'Confirm my account'

    # Test that the email address is confirmed and correct success message is present
    expect(page).to have_content 'Your email address has been successfully confirmed.'

    # Test logging in
    # visit new_user_session_path
    # fill_in 'user_email', with: new_user.email
    # fill_in 'user_password', with: new_user.password
    #
    # click_button 'Log In'
    #
    # expect(page).to have_content('Signed in successfully.')
  end
end
