require 'pry'
require_relative 'board'
require_relative 'player'

class Game
	attr_accessor :player1
	attr_accessor :player2
	attr_accessor :board
	

	def initialize(name1, name2)
		@board = Board.new
		@player1 = Player.new(name1, "X")
		@player2 = Player.new(name2, "O")
	end


	# def who_begins?
	# 	dice = rand(1..2)
	# 	if dice == 1
	# 		ask_player_to_play(@player1)
	# 	else
	# 		ask_player_to_play(@player2)
	# 	end
	# end 


	def ask_player_to_play(player)
		puts ""
		puts "Au tour de #{player.name} de jouer !"
		print "#{player.name}, sélectionne une case : "
	end


	def player_move(player, position) 
		@board.board_array.each{|b_case| b_case.value = player.symbol if b_case.position == position}
	end


	def is_there_a_winner?
		return @board.wins_combinations?
	end


	def is_draw?
		return (@board.is_full? && !@board.wins_combinations?)
	end


	def is_still_ongoing?
		if is_there_a_winner? == false && is_draw? == false
			return true
		else
			return false
		end
	end

end