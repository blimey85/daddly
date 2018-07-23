RSpec.feature 'Create Event', type: :system, js: true do
  before(:all) do
    DatabaseCleaner.clean_with(:truncation)

    # Categories are not added by users so we load these from a seeds file
    load Rails.root + 'db/seeds/event_category_seeds.rb'
  end

  context 'Add an event' do
    include_context 'user'

    scenario 'user fills in the add event form' do
      user.confirm
      sign_in user

      event = build_stubbed(:event, user: user)
      visit new_event_path

      # Select two event categories
      find('[for=event_event_category_ids_1]').click
      find('[for=event_event_category_ids_3]').click

      # Fill in name and description
      fill_in 'event[name]', with: event.name
      fill_in 'event[description]', with: event.description

      # Select start date
      find('#event_start_date').click
      find('#event_start_date_root button.picker__button--today').click

      # Select start time
      find('#event_start_time').click
      find('.clockpicker-hours .clockpicker-tick', text: '12').click
      find('.clockpicker-minutes .clockpicker-tick', text: '00').click
      find_button('Done').click

      # Select end date
      find('#event_end_date').click
      find('#event_end_date_root button.picker__button--today').click

      # Select end time
      find('#event_end_time').click
      find('.clockpicker-hours .clockpicker-tick', text: '6').click
      find('.clockpicker-minutes .clockpicker-tick', text: '30').click
      find_button('Done').click

      # Create new venue
      venue = FactoryBot.build_stubbed(:venue)
      first('div.selectize-input input').set(venue.name)
      find('.create').click
      fill_in 'venue[address]', with: venue.address
      fill_in 'venue[city]', with: venue.city
      selectize_single_select('venue_state', STATES[venue.state.to_sym])
      fill_in 'venue[zipcode]', with: venue.zipcode
      # click_button 'Create Venue'

      # expect(page).to have_content 'something'
    end
  end
end
