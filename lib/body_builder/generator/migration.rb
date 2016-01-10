class Migration < ActiveRecord::Migration
  def self.create_table(name, options = {})
    create_table(name) do |t|
      options.each |name, type|
        t.column name, type
      end
    end
  end

  def self.drop_table(name)
    drop_table name
  end
end
