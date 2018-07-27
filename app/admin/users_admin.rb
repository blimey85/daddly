Trestle.resource(:users) do
  menu do
    group :users, priority: :first do
      item :users, icon: 'fa fa-users', priority: :first
    end
  end

  search do |q|
    q ? User.where('username ILIKE :q or first_name ILIKE :q or last_name ILIKE :q', q: "%#{q}%") : collection
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id, link: true
    column :avatar do |user|
      "<image class='avatar' src='#{user.avatar}'>".html_safe if user.avatar.present?
    end
    column :username
    column :first_name
    column :last_name
    column :age
    column :created_at, align: :center
    column :current_sign_in_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |user|
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
  #   params.require(:user).permit(:name, ...)
  # end
end
