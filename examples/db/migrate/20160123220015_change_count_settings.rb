class ChangeCountSettings < ActiveRecord::Migration
  def change
    change_column :settings, :count, :string
  end
end
