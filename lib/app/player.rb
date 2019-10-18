require 'pry'

class Player
	attr_accessor :name
	attr_accessor :symbol
#	attr_accessor :games_won


	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end

end