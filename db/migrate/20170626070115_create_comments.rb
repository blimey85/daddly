class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :body
      t.integer :parent_id
      t.integer :user_id
      t.datetime :edited_at
      t.integer :upvote_count, :default => 0

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
