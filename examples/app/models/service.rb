class Service < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	before_save :capitalize_world_of_alphabet
	validates :world_of_alphabet, presence: true, uniqueness: true

	def capitalize_world_of_alphabet
	  self.world_of_alphabet = self.world_of_alphabet.to_s.mb_chars.capitalize[0]
	end
end
