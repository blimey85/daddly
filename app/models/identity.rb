# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  provider     :string
#  accesstoken  :string
#  uid          :string
#  name         :string
#  email        :string
#  nickname     :string
#  image        :string
#  phone        :string
#  urls         :string
#  refreshtoken :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_identities_on_user_id  (user_id)
#

class Identity < ApplicationRecord
  belongs_to :user

  validates :uid, :provider, :user_id, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.find_for_oauth(auth)
    identity = find_by(provider: auth.provider, uid: auth.uid)
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity.accesstoken = auth.credentials.token
    identity.refreshtoken = auth.credentials.refresh_token
    identity.name = auth.info.name
    identity.email = auth.info.email
    identity.nickname = auth.info.nickname
    identity.image = auth.info.image
    identity.phone = auth.info.phone
    identity.urls = (auth.info.urls || '').to_json
    identity.save
    identity
  end

  # With example: Josh M. Steiner
  # first_name: Josh M.
  # last_name: Steiner
  def first_name
    name.split(' ')[0..-2].join(' ')
  end

  def last_name
    name.split(' ').last
  end
end
