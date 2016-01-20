class ChangeClientsToTextTurns < ActiveRecord::Migration
  def change
    change_column :turns, :clients, :text
  end
end
