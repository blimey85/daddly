class AddParentTypeAndParentIdToPings < ActiveRecord::Migration[5.1]
  def change
    add_column :pings, :pingable_parent_id, :integer
    add_column :pings, :pingable_parent_type, :string
  end
end
