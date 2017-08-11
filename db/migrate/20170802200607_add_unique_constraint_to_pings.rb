class AddUniqueConstraintToPings < ActiveRecord::Migration[5.1]
  def change
    add_index :pings, [:pingable_id, :pingable_type, :pinger_id], unique: true
  end
end
