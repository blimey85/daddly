class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :rsvp_count
      t.integer :rsvp_min_limit
      t.integer :rsvp_max_limit
      t.boolean :waitlist
      t.integer :waitlist_count
      t.integer :status
      t.integer :type
      t.integer :visibility
      t.belongs_to :user
      t.references :venue, foreign_key: false

      t.timestamps
    end
  end
end
