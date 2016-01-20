class RemoveClientsFromTurn < ActiveRecord::Migration
  def change
    remove_column :turns, :clients
  end
end
