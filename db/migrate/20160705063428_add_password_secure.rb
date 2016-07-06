class AddPasswordSecure < ActiveRecord::Migration
  def change
    rename_column :users, :password_secure, :password_digest
  end
end
