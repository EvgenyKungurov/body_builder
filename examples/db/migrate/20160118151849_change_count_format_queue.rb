class ChangeCountFormatQueue < ActiveRecord::Migration
  def change
    change_column :queue, :count, :string
    change_column :queue, :count_day, :string
  end
end
