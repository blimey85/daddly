# == Schema Information
#
# Table name: events
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  description    :text
#  starts_at      :datetime
#  ends_at        :datetime
#  rsvp_count     :integer
#  rsvp_min_limit :integer
#  rsvp_max_limit :integer
#  waitlist       :boolean
#  waitlist_count :integer
#  status         :integer
#  type           :integer
#  visibility     :integer
#  comments_count :integer          default(0), not null
#  votes_count    :integer          default(0), not null
#  user_id        :bigint(8)
#  venue_id       :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_events_on_user_id   (user_id)
#  index_events_on_venue_id  (venue_id)
#

Trestle.resource(:events) do
  menu do
    group :events, priority: 10 do
      item :events, icon: 'far fa-calendar-alt', priority: :first
    end
  end

  scope :today_events, default: true, label: 'Today\'s Events'
  scope :future_events
  scope :past_events
  scope :all_events

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :venue do |event|
      link_to(event&.venues&.first&.name, "venues/#{event&.venues&.first&.id}")
    end
    column :user
    column :starts_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |event|
    tab :event do
      # render 'map', venue: event.venues.first if event.venues.first.present?
      text_field :name
      text_area :description

      row do
        col(xs: 6) { datetime_field :starts_at }
        col(xs: 6) { datetime_field :ends_at }
      end

      select :user_id, User.all
      select :venue_id, Venue.all
    end

    tab :venues, badge: event.venues.size do
      render 'map', event: event # if event.venues.present?
      table event.venues, admin: :venues do
        column :id
        column :name
        column :address
        column :city
        column :state
        column :zipcode
        column :created_at, align: :center
        actions
      end
    end

    if event.name.present?
      tab :comments, badge: event.comments.size do
        table event.comments, admin: :comments do
          column :id, link: true
          column :commentable
          column :body
          column :user
          column :created_at, align: :center
        end
      end
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:event).permit(:name, ...)
  # end
end
