class AddCommentsCountToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :comments_count, :integer, null: false, default: 0
  end
end
