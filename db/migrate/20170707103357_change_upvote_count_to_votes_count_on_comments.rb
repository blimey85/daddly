class ChangeUpvoteCountToVotesCountOnComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :upvote_count, :votes_count
  end
end
