# == Schema Information
#
# Table name: interests
#
#  id              :integer          not null, primary key
#  sub_category_id :integer
#  name            :string(255)
#

FactoryGirl.define do
  factory :interest do
  end
end
