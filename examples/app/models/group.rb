class Group < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :users
end
