class UserController < ApplicationController
  before_action :set_user, only: [:edit, :show]
  before_action :set_interests, only: :edit

  respond_to :html, :json, :js

  def edit
  end

  def show
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = user_params
    @user.save(context: :profile)

    if user_params['avatar'] == '1'
      @user.remove_avatar!
      @user.save
    end

    @interests = @user.interests.build
    flash[:notice] = 'User was successfully updated.'
    set_interests if @user.errors.any?
    respond_with(@user)
  end

  def mentions
    @users = User.ransack(first_name_or_username_cont: params[:r]).result(distinct: true)
    render json: @users, each_serializer: MentionsSerializer
  end

  private

  def set_interests
    @categories = Category.includes(sub_categories: :interests)
  end

  def set_user
    @user = User.includes(:interests, :kids).find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :city, :state, :zipcode, :latitude, :longitude, :age, :bio, :user_id, :avatar,
      interest_ids: [],
      kids_attributes: [:id, :gender, :age, :_destroy]
    )
  end
end
