class AddGroupIdAndWorldOfAlphabetToServices < ActiveRecord::Migration
  def change
    add_column :services, :group_id, :integer
    add_column :services, :world_of_alphabet, :string
  end
end
