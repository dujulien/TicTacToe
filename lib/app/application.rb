require 'pry'

require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative '../views/show'

class Application
	attr_accessor :game
	attr_accessor :show
	attr_accessor :name1
	attr_accessor :name2
	@@number_games


	def initialize 	
		print "Nom du joueur 1 : "
		@name1 = gets.chomp		
		print "Nom du joueur 2 : "
		@name2 = gets.chomp
		
		@game = Game.new(@name1, @name2)
		@show = Show.new
		#game.who_begins?
		#player1 = @game.player1
		#player2 = @game.player2
	end

	def begin_game
		combinations = []
		while @game.is_still_ongoing?
			@game.ask_player_to_play(@game.player1)
			position1 = gets.chomp.to_s
			while combinations.include?(position1)
				print "Case occupée, sélectionne une autre case : "
				position1 = gets.chomp.to_s
			end
			combinations << position1
			@game.player_move(@game.player1, position1)
			@show.display_board(@game.board.board_array)
			# puts game.board.wins_combinations?
			# pp game.board
			if @game.is_there_a_winner?
				puts @game.is_there_a_winner?
				puts "#{@game.player1.name} a gagné !"
				break
			elsif @game.is_draw?
				puts "Egalité, fin de la partie"
				break
			else
				@game.ask_player_to_play(@game.player2)
				position2 = gets.chomp.to_s
				while combinations.include?(position2)
					print "Case occupée, sélectionne une autre case : "
					position2 = gets.chomp.to_s
				end
				combinations << position2
				@game.player_move(@game.player2, position2)
				@show.display_board(@game.board.board_array)
					if @game.is_there_a_winner?
						puts "#{@game.player2.name} a gagné !"
						break
						elsif @game.is_draw?
						puts "Egalité, fin de la partie"
						break
					end
			end
		end
	end

	def replay
		print "Souhaitez-vous rejouer ?"
		answer = gets.chomp.to_s
		if answer == "Yes"
			@game = Game.new(@name1, @name2)
			self.begin_game
		end
	end

	def perform
		self.begin_game
		self.replay
	end

end

app = Application.new
app.perform


	
