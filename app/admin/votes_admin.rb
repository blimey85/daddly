Trestle.resource(:votes) do
  menu do
    group :users, priority: :first do
      item :votes, icon: "fa fa-users", priority: 1
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id, sort: true
    column :votable, sort: false
    column :user, sort: false
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |vote|
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
  #   params.require(:vote).permit(:name, ...)
  # end
end
