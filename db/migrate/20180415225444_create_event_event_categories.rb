class CreateEventEventCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :event_event_categories do |t|
      t.integer :event_id
      t.integer :event_category_id

      t.timestamps
    end
  end
end
