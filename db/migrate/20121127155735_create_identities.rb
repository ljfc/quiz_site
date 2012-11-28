class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user
      t.string :provider
      t.string :unique_identifier
      t.string :password_digest
      t.string :image_url
      t.text :info

      t.timestamps
    end
    add_index :identities, :user_id
    add_index :identities, :provider
    add_index :identities, :unique_identifier, unique: true
  end
end
