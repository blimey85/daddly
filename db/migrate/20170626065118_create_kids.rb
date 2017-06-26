class CreateKids < ActiveRecord::Migration[5.1]
  def change
    create_table :kids do |t|
      t.integer :gender, null: false, default: 0
      t.integer :age, null: false
      t.references :user, foreign_key: false
    end
  end
end
