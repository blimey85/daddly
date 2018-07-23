class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service

  def destroy
    @service.destroy
    provider =
      if @service.provider == 'google_oauth2'
        'Google'
      else
        @service.provider
      end
    flash.notice = "Successfully removed your #{provider.titleize} account."
    redirect_back(fallback_location: root_path)
  end

  private

  def set_service
    @service = current_user.services.find(params[:id])
  end
end
