# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  edited_at        :datetime
#  votes_count      :integer          default(0)
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#  index_comments_on_user_id                              (user_id)
#

RSpec.describe Comment, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:commentable) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:pings) }
    it { is_expected.to have_many(:votes) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:commentable_id) }
    it { is_expected.to validate_presence_of(:commentable_type) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
