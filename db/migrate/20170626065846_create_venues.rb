class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.float :latitude
      t.float :longitude
      t.integer :visibility

      t.timestamps
    end
  end
end
