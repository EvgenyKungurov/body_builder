class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :groups
  end
end
