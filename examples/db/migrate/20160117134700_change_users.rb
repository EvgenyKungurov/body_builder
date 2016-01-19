class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :text
    add_column :users, :remember_token, :text
  end
end
