require 'pry'
require_relative 'board_case'
require_relative 'game'

class Board
	attr_accessor :board_array

	def initialize
		position = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
		@board_array = []
		9.times do |i|
			board_case_i = BoardCase.new(position[i])
			@board_array << board_case_i
		end
	end


	def wins_combinations?
		wins_combinations = [
			[@board_array[0],@board_array[1],@board_array[2]], 
			[@board_array[3],@board_array[4],@board_array[5]], 
			[@board_array[6],@board_array[7],@board_array[8]], 
			[@board_array[0],@board_array[3],@board_array[6]], 
			[@board_array[1],@board_array[4],@board_array[7]], 
			[@board_array[2],@board_array[5],@board_array[8]], 
			[@board_array[0],@board_array[4],@board_array[8]],
			[@board_array[2],@board_array[4],@board_array[6]]
		]
		win = false
		wins_combinations.each do |w_comb|
			if (w_comb[0].value == w_comb[1].value) && (w_comb[1].value == w_comb[2].value) && (w_comb[0].value != " ")
				win = true
			end
		end
		return win
	end


	def is_full?
		i = 0
		full = true
		for i in (0..8)
			if @board_array[i].value == " "
				full = false
			end
		end
		return full
	end

end

