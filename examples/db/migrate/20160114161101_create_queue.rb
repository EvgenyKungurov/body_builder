class CreateQueue < ActiveRecord::Migration
  def self.up
    create_table :queue do |t|
      t.integer :count
      t.integer :count_day
      t.integer :service_id

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :queue
  end
end
