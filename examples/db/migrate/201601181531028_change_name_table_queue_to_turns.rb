class ChangeNameTableQueueToTurns < ActiveRecord::Migration
  def change
    rename_table :queues, :turns
  end
end
