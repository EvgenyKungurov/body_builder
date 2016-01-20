class AddDateToTurns < ActiveRecord::Migration
  def change
    add_column :turns, :day, :string
  end
end
