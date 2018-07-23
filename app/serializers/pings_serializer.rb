# == Schema Information
#
# Table name: pings
#
#  id            :integer          not null, primary key
#  pingable_id   :integer
#  pingable_type :string(255)
#  pinger_id     :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_pings_on_user_id  (user_id)
#
# == Output example:
#
#  {
#    "id": 1,
#    "pinger_id": 2,
#    "user_id": 2,
#    "username": "bobby123",
#    "qtip_title": "Bob Somebody",
#    "qtip_text": "A little about me. What can I say?"
#  }

class PingsSerializer < ActiveModel::Serializer
  attributes :id,
             :pinger_id,
             :user_id,
             :username,
             :qtip_title,
             :qtip_text

  def qtip_text
    object&.user&.bio
  end

  def qtip_title
    object&.user&.fullname
  end

  def username
    object&.user&.username
  end
end
