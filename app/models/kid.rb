# == Schema Information
#
# Table name: kids
#
#  id         :integer          not null, primary key
#  gender     :integer          default(""), not null
#  age        :integer          not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kid < ApplicationRecord
  belongs_to :user

  GENDERS = [:'', :'Not Saying', :Boy, :Girl]
  enum gender: GENDERS
end
