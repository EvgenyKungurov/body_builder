class ChangeSymbolNameClients < ActiveRecord::Migration
  def change
    rename_column :clients, :symbol_name, :symbol_name_turn
  end
end
