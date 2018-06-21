RSpec.feature 'Sign Up', type: :system, js: true do
  # these tests need to run in a particular oder so we override the global setting
  before(:context) { @list = [] }

  feature 'complete registration form' do
    background do
      clear_emails

      visit root_path

      fill_in 'user[email]', with: 'tester@testdomain.test'
      fill_in 'user[password]', with: 'pa$$word'
      fill_in 'user[password_confirmation]', with: 'pa$$word'

      click_button 'Create Account'

      open_email('tester@testdomain.test')
    end

    scenario 'open confirmation email' do
      @list << 1
      expect(current_email).to have_content 'Welcome tester@testdomain.test!'
    end

    scenario 'click link to confirm account' do
      @list << 2
      current_email.click_link 'Confirm my account'
      expect(page).to have_content 'Your email address has been successfully confirmed.'
    end
  end
end

# describe 'signing up' do
#   it "allows user to sign up" do
#     visit root_path
#
#     fill_in 'user[email]', with: 'tester@testdomain.test'
#     fill_in 'user[password]', with: 'pa$$word'
#     fill_in 'user[password_confirmation]', with: 'pa$$word'
#
#     click_button 'Create Account'
#
#     open_email('tester@testdomain.test')
#     save_and_open_page
#
#     # require 'pry'; binding.pry
#
#
#     expect(page).to have_body_text(/#{user_confirmation_url}/)
#
#     #
#     # visit_in_email('Confirm my account')
#     #
#     # message = 'Your email address has been successfully confirmed'
#     #
#     # expect(page).to have_content(message)
#   end
# end
