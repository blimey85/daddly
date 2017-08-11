class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings do |t|
      t.integer :pingable_id
      t.string :pingable_type
      t.bigint :pinger_id
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
