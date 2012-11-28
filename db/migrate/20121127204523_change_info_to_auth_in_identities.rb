class ChangeInfoToAuthInIdentities < ActiveRecord::Migration
  def up
    rename_column :identities, :info, :auth
  end

  def down
    rename_column :identities, :auth, :info
  end
end
