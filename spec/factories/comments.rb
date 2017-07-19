# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string(255)
#  body             :text(65535)
#  parent_id        :integer
#  user_id          :integer
#  edited_at        :datetime
#  votes_count      :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#

FactoryGirl.define do
  factory :comment do
  end
end
