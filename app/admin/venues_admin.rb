# == Schema Information
#
# Table name: venues
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  address    :string
#  city       :string
#  state      :string
#  zipcode    :integer
#  latitude   :float
#  longitude  :float
#  visibility :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

Trestle.resource(:venues) do
  menu do
    group :events, priority: 10 do
      item :venues, icon: 'far fa-calendar-alt'
    end
  end

  collection do
    # Set the default order when manual sorting is not applied
    Venue.order(name: :asc)
  end

  search do |q|
    q ? collection.where('name ILIKE ?', "%#{q}%") : collection
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  table do
    column :id
    column :name
    column :address
    column :city
    column :state
    column :zipcode
    # column :latitude
    # column :longitude
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |venue|
    render 'map', venue: venue
    text_field :name
    text_field :address
    row do
      col(xs: 4) { text_field :city }
      col(xs: 4) { text_field :state }
      col(xs: 4) { text_field :zipcode }
    end


    row do
      col(xs: 6) { datetime_field :updated_at }
      col(xs: 6) { datetime_field :created_at }
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
  #   params.require(:venue).permit(:name, ...)
  # end
end
