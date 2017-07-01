class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    generic_callback('google_oauth2')
  end

  def facebook
    generic_callback('facebook')
  end

  def generic_callback(provider)
    @identity = Identity.find_for_oauth request.env['omniauth.auth']

    @user = @identity.user || current_user

    if @user.nil?
      @user = User.create(
        email: @identity.email,
        first_name: @identity.first_name,
        last_name: @identity.last_name,
        oauth_callback: true
      )
      @identity.update_attribute(:user_id, @user.id)
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute(:email, @identity.email)
    end

    if @user.first_name.blank? && @identity.first_name && @identity.last_name
      @user.update_attributes(first_name: @identity.first_name, last_name: @identity.last_name)
    end

    if @user.persisted?
      @identity.update_attribute(:user_id, @user.id)
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url
    end
  end
end
