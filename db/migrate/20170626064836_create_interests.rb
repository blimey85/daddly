class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.string :category
      t.string :subcategory
      t.string :name
    end
  end
end
