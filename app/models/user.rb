class User < ApplicationRecord
  attr_accessor :oauth_callback
  attr_accessor :current_password

  # validates_presence_of   :email, if: :email_required?
  # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  # validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  # validates_presence_of     :password, if: :password_required?
  # validates_confirmation_of :password, if: :password_required?
  # validates_length_of       :password, within: Devise.password_length, allow_blank: true

  mount_uploader :avatar, AvatarUploader

  has_many :identities, dependent: :destroy
  has_many :kids, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :kids, reject_if: :all_blank, allow_destroy: true

  has_many  :user_interests
  has_many  :interests, :through => :user_interests

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauth_providers => [:facebook,:google_oauth2]

  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end

  def google_oauth2_client
    @google_oauth2_client ||= GoogleAppsClient.client( google_oauth2 )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def password_required?
    return false if email.blank? || !email_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    @oauth_callback != true
  end

  def fullname
    "#{first_name} #{last_name[0]}"
  end

  # Geo Location Block
  # validates :zipcode, presence: true
  geocoded_by :zipcode  do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.state = ::States.key(geo.state) # convert state to abbreviation
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  # after_validation :geocode
end