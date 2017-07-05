class AddVotesCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :votes_count, :integer, null: false, default: 0
  end
end
