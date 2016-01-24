class CreateRestrictions < ActiveRecord::Migration
  def change
    rename_table :settings, :restrictions
  end
end
