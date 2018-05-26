class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service

  def destroy
    @service.destroy
    flash.notice = "Successfully removed #{@service.provider.titleize} account."
    redirect_back(fallback_location: root_path)
  end

  private

  def set_service
    @service = current_user.services.find(params[:id])
  end
end
