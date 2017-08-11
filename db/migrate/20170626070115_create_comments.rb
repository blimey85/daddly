class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :body
      t.integer :parent_id
      t.datetime :edited_at
      t.integer :votes_count, :default => 0
      t.references :user, foreign_key: false

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
