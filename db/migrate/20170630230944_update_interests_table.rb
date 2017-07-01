class UpdateInterestsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :interests, :subcategory, :sub_category_id
    change_column :interests, :sub_category_id, :integer
    remove_column :interests, :category, :string
  end
end
