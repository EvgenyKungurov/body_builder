class AddDayHourMinutesToClients < ActiveRecord::Migration
  def change
    rename_column :clients, :recorded_on, :day
    add_column :clients, :hour, :string
    add_column :clients, :minute, :string
  end
end
