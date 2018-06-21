#
#
# RSpec.feature 'Login', type: :system do
#   let(:user) { create(:user) }
#
#   scenario 'user navigates to the login page and successfully logs in' do
#     user
#     visit root_path
#     find('a', text: 'Sign In').click
#     fill_in 'user[email]', with: user.email
#     fill_in 'user[password]', with: user.password
#     find('input[name="commit"]').click
#     page.should have_text('Signed in successfully.')
#   end
# end
