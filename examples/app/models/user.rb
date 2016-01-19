class User < ActiveRecord::Base
	validates :name, presence: true
	validates :group_id, presence: true
	belongs_to :group
end
