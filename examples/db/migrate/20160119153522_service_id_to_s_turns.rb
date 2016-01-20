class ServiceIdToSTurns < ActiveRecord::Migration
  def change
    change_column :turns, :service_id, :string
  end
end
