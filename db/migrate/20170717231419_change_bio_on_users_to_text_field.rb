class ChangeBioOnUsersToTextField < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avater, :string
    change_column :users, :bio, :text
  end
end
