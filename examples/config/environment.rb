require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'live_queue',
  username: 'queue',
  password: 'live_queue_pass2016',
  host: 'localhost'
)
