class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :votable_id
      t.integer :votable_type
      t.integer :user_id

      t.timestamps
    end
    add_index :votes, [:votable_id, :votable_type]
  end
end
