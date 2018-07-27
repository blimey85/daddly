Trestle.resource(:interests) do
  menu do
    group :user_interests do
      item :interests, icon: 'far fa-shuttlecock', priority: 30
    end
  end

  collection do
    Interest.includes(:category, :sub_category).order('categories.name ASC, sub_categories.name ASC, interests.name ASC')
  end

  search do |q|
    q ? collection.where("name ILIKE ?", "%#{q}%") : collection
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id
    column :category, sort: false
    column :sub_category, sort: false
    column :name

    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do
    select :category, Category.all
    select :sub_category, SubCategory.all
    text_field :name
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:interest).permit(:name, ...)
  # end
end
