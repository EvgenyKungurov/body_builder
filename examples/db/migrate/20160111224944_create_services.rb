class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.text :name

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :services
  end
end
