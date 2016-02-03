ActiveRecord::Schema.define(version: 20160128135049) do

  create_table :groups do |t|
    t.string :name

    t.timestamps null: false
  end

  create_table :users do |t|
    t.string :name
    t.text :password_digest
    t.text :remember_token
    t.string :group_id

    t.timestamps null: false
  end

  create_table :services do |t|
    t.text :name
    t.text :world_of_alphabet

    t.timestamps null: false
  end

  create_table :turns do |t|
    t.text :day
    t.text :service_id

    t.timestamps null: false
  end

  create_table :clients do |t|
    t.string :status
    t.string :user_id
    t.string :day
    t.string :symbol_name_turn
    t.string :turn_id
    t.string :hour
    t.string :minute

    t.timestamps null: false
  end

  create_table :client_restrictions do |t|
    t.text :name
    t.text :count

    t.timestamps null: false
  end

  create_table :logs do |t|
    t.string :type
    t.string :count

    t.timestamps null: false
  end

end
