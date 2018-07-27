Trestle.resource(:kids) do
  menu do
    group :users, priority: :first do
      item :kids, icon: "fa fa-users", priority: 1
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id, link: true
    column :gender
    column :age
    column :user, header: 'Parent Name'
    column :username, header: 'Parent Username' do |kid|
      admin_link_to(kid.user.username, kid.user)
    end
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |kid|
    select :user_id, User.all, label: 'Parent'
    select :gender, Kid.genders.keys
    text_field :age
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:kid).permit(:name, ...)
  # end
end
