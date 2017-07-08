class ChangeVoteVotableTypeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :votes, :votable_type, :string
  end
end
