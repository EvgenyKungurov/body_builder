class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.integer :count
      t.string :type

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :logs
  end
end
