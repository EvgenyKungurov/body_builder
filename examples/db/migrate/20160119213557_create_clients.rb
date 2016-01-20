class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :status
      t.string :user_id
      t.string :recorded_on
      t.string :symbol_name
      t.string :turn_id

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :clients
  end
end
