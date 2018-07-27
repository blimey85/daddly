Trestle.resource(:services) do
  menu do
    group :users, priority: :first do
      item :services, icon: "fa fa-users", priority: 1
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id
    column :user, sort: false
    column :username, ->(service) { service.user.username }
    column :provider, sort: :provider do |p|
      if p.provider == 'google_oauth2'
        provider = 'google'
        icon = 'google'
      elsif p.provider == 'facebook'
        provider = 'facebook'
        icon = 'facebook-f'
      elsif p.provider == 'twitter'
        provider = 'twitter'
        icon = 'twitter'
      end
      icon("fab fa-#{icon}") + ' ' + provider
    end
    column :uid, header: 'UID'
    column :expires_at, align: :center
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |service|
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
  #   params.require(:service).permit(:name, ...)
  # end
end
