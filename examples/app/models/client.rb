class Client < ActiveRecord::Base
  belongs_to :user
  belongs_to :turn
end
