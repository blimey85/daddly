class CreateEventVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :event_venues do |t|
      t.references :event, foreign_key: false
      t.references :venue, foreign_key: false
    end
  end
end
