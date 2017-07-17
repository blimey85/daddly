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

require 'rails_helper'

RSpec.describe Ping, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
