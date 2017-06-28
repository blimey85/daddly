class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.references :user, foreign_key: false
      t.string :provider
      t.string :accesstoken
      t.string :uid
      t.string :name
      t.string :email
      t.string :nickname
      t.string :image
      t.string :phone
      t.string :urls
      t.string :refreshtoken

      t.timestamps
    end
  end
end
