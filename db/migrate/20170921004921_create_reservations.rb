class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :event
      t.references :user
      t.string :reservation_type
      t.timestamps
    end
  end
end
