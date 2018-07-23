# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  username               :string
#  first_name             :string
#  last_name              :string
#  age                    :integer
#  bio                    :text
#  city                   :string
#  state                  :string
#  zipcode                :integer
#  latitude               :float
#  longitude              :float
#  avatar                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  moderator              :boolean
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  include SimpleDiscussion::ForumUser
  extend StatesHelper

  has_many :events, through: :reservations
  has_many :kids, dependent: :destroy, inverse_of: :user
  has_many :pings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests

  attr_accessor :current_password
  attr_accessor :oauth_callback

  accepts_nested_attributes_for :kids, reject_if: :all_blank, allow_destroy: true

  ### Devise Validations ###
  validates :email, presence: true, if: :email_required?
  validates :email,
            uniqueness: true,
            format: { with: Devise.email_regexp },
            allow_blank: true,
            if: :email_changed?

  validates :password,
            presence: true,
            length: { within: Devise.password_length },
            confirmation: true,
            if: :password_required?

  ### User Profile Validations ###
  with_options on: :profile do
    validates :age, numericality: { greater_than: 12 }
    validates :bio, length: { minimum: 32 }
    validates :first_name, :last_name, length: { minimum: 2 }
    validates :zipcode, format: { with: /\A\d{5}(-\d{4})?\z/, message: 'is not a valid US zipcode' }
    validates :zipcode, presence: true, if: :zipcode_required?
  end

  ### Devise ###
  devise :confirmable, :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_now
  end

  mount_uploader :avatar, AvatarUploader
  acts_as_messageable

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
    "#{first_name} #{last_name}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  # Geo Location Block
  geocoded_by :zipcode do |obj, results|
    if (geo = results.first)
      obj.city = geo.city
      obj.state = STATES.key(geo.state) # convert state to abbreviation
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  before_validation :geocode, if: :zipcode_changed?
end
