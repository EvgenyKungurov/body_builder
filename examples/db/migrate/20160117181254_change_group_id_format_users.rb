class ChangeGroupIdFormatUsers < ActiveRecord::Migration
  def change
    change_column :users, :group_id, :string
  end
end
