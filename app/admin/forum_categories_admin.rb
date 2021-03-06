Trestle.resource(:forum_categories) do
  menu do
    item :forum_categories, icon: 'far fa-user-friends', group: :community
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id, link: true
    column :name
    column :slug
    column :color, sort: :color, align: :center do |fc|
      "<span style=\"padding: 2px 5px;color:#fff;background-color:#{fc.color}\">#{fc.color}</span>".html_safe
    end
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |forum_category|
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
  #   params.require(:forum_category).permit(:name, ...)
  # end
end
