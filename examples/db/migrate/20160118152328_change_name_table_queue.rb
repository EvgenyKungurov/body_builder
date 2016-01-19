class ChangeNameTableQueue < ActiveRecord::Migration
  def change
    rename_table :queue, :queues
  end
end
