# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default("")
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  username               :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  age                    :integer
#  bio                    :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  zipcode                :integer
#  latitude               :float(24)
#  longitude              :float(24)
#  avater                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  attr_accessor :oauth_callback
  attr_accessor :current_password

  ### Devise Validations ###
  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: Devise.password_length, allow_blank: true

  ### User Profile Validations ###
  validates :first_name, length: { minimum: 5 }
  validates :last_name, length: { minimum: 5 }
  validates_format_of :zipcode, :with => /\A\d{5}(-\d{4})?\z/, :message => 'is not a valid US zipcode'
  validates_numericality_of :age, greater_than: 12 # user must be at least 13
  validates :bio, length: { minimum: 32 }

  mount_uploader :avatar, AvatarUploader

  has_many :identities, dependent: :destroy
  has_many :kids, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :kids, reject_if: :all_blank, allow_destroy: true

  has_many  :user_interests
  has_many  :interests, through: :user_interests

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, omniauth_providers: [:facebook, :google_oauth2]

  def google_oauth2
    # identities.where(:provider => 'google_oauth2').first
    identities.find_by(provider: 'google_oauth2')
  end

  def google_oauth2_client
    @google_oauth2_client ||= GoogleAppsClient.client(google_oauth2)
  end

  def facebook
    # identities.where(:provider => 'facebook').first
    identities.find_by(provider: 'facebook')
  end

  def facebook_client
    @facebook_client ||= Facebook.client(access_token: facebook.accesstoken)
  end

  def password_required?
    return false if email.blank? || !email_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true unless @oauth_callback
  end

  def zipcode_required?
    true unless @oauth_callback
  end

  def fullname
    "#{first_name} #{last_name[0]}"
  end

  # Geo Location Block
  validates :zipcode, presence: true, if: :zipcode_required?
  geocoded_by :zipcode do |obj, results|
    if (geo = results.first)
      obj.city = geo.city
      obj.state = ::States.key(geo.state) # convert state to abbreviation
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode if :zipcode_required?
end
