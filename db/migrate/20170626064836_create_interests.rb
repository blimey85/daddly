class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.string :name
      t.references :sub_category, foreign_key: false
    end
  end
end
