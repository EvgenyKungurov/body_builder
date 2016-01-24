class CreateClientRestrictions < ActiveRecord::Migration
  def change
    rename_table :restrictions, :client_restrictions
  end
end
