require 'pry'

class BoardCase
	attr_accessor :value
	attr_accessor :position
	
	def initialize(position, value = " ")
		@position = position
		@value = value
	end

end