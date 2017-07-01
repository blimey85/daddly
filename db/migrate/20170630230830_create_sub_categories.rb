class CreateSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.belongs_to :category, foreign_key: false

    end
  end
end
