class DeleteColumnCountTurns < ActiveRecord::Migration
  def change
    remove_column :turns, :count
    rename_column :turns, :count_day, :clients
  end
end
