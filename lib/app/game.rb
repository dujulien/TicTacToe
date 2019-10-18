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

	#Display messages to ask the player to play
	def ask_player_to_play(player)
		puts ""
		puts "Au tour de #{player.name} de jouer !"
		print "#{player.name}, sélectionne une case : "
	end

	#Replace player's symbol in boardcase's value according to its position given in entry
	def player_move(player, position) 
		@board.board_array.each{|b_case| b_case.value = player.symbol if b_case.position == position}
	end

	#Boolean to check if there is a winner
	def is_there_a_winner?
		return @board.wins_combinations?
	end

	#Boolean to check if there is a draw
	def is_draw?
		return (@board.is_full? && !@board.wins_combinations?)
	end

	#Boolean to check if game is still ongoing (no draw and no winner)
	def is_still_ongoing?
		return is_there_a_winner? == false && is_draw? == false
	end

end