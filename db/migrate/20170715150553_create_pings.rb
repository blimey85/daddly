class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings do |t|
      t.integer :pingable_id
      t.integer :pingable_type
      t.integer :pinger_id
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
