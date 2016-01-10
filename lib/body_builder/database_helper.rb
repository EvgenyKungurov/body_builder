require 'yaml'
require 'active_record'

module BodyBuilder
  class DB
    def self.db_connect
      if File.exist? File.join('db', 'database.yml')
        db = YAML.load_file(File.join('db', 'database.yml'))
      else
        return "database.yml does not exist in db folder"
      end
      ActiveRecord::Base.establish_connection(db)
    end
  end
end
