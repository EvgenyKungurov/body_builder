class Turn < ActiveRecord::Base
	validates :day, presence: true
	has_many :clients
end
