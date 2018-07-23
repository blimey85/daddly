# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  edited_at        :datetime
#  votes_count      :integer          default(0)
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#  index_comments_on_user_id                              (user_id)
#

FactoryBot.define do
  factory :comment do
    commentable_id    1
    commentable_type  'Event'
    body              { Faker::TheITCrowd.quote }
    association       :user

    after :create do |comment|
      create_list :ping, 1, pingable_id: comment.id
    end
  end
end
