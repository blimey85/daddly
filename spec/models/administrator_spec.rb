# == Schema Information
#
# Table name: administrators
#
#  id                        :bigint(8)        not null, primary key
#  email                     :string
#  password_digest           :string
#  first_name                :string
#  last_name                 :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'rails_helper'

RSpec.describe Administrator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
