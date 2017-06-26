class CreateUserInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_interests do |t|
      t.belongs_to :user
      t.belongs_to :interest
      t.integer :experience
    end
  end
end
