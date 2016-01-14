class CreateQueue < ActiveRecord::Migration
  def self.up
    create_table :queue do |t|
      t.integer :count
      t.

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :queue
  end
end
