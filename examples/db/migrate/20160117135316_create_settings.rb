class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.integer :count
      t.string :name

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :settings
  end
end
