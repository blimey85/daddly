Trestle.resource(:event_categories) do
  menu do
    group :events, priority: 10 do
      item :event_categories, icon: 'far fa-calendar-alt'
    end
  end

  collection do
    EventCategory.order(name: :asc)
  end

  search do |q|
    q ? collection.where('name ILIKE ?', "%#{q}%") : collection
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id
    column :name

    column :color, sort: :color, align: :center do |ec|
      "<span style=\"padding: 2px 5px;color:#fff;background-color:##{ec.color}\">##{ec.color}</span>".html_safe
    end

    column :icon, sort: :icon do |ec|
      icon(ec.icon) + " \"#{ec.icon}\""
    end

    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |event_category|
  #   text_field :name
  #
  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:event_category).permit(:name, ...)
  # end
end
