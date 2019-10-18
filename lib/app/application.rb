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
	@@position_possible = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
	@@combinations =[]
	@@player1_wins = 0
	@@player2_wins = 0
	@@nb_draws = 0
	@@nb_games = 0


	def initialize 	
		print "Nom du joueur 1 : "
		@name1 = gets.chomp		
		print "Nom du joueur 2 : "
		@name2 = gets.chomp
		@game = Game.new(@name1, @name2)
		@show = Show.new
	end

	#Begin a tictactoe game and stop when there is a winner or a draw
	def begin_game
		@@nb_games += 1
		@@combinations = []
		@show.display_board(@game.board.board_array)
		while @game.is_still_ongoing?
			self.player_action(@game.player1)
			if @game.is_there_a_winner?
				@@player1_wins += 1
				puts "#{@game.player1.name} a gagné !".colorize(:green)
				break
			elsif @game.is_draw?
				@@nb_draws += 1
				puts "Egalité, fin de la partie"
				break
			else
				self.player_action(@game.player2)
					if @game.is_there_a_winner?
						@@player2_wins += 1
						puts "#{@game.player2.name} a gagné !".colorize(:green)
						break
						elsif @game.is_draw?
							@@nb_draws += 1
							puts "Egalité, fin de la partie"
						break
					end
			end
		end
	end

	#Compute a player's action : verify if position exists and is empty and display tictactoe grid
	def player_action(player)
		@game.ask_player_to_play(player)
		position = gets.chomp.to_s
		while @@combinations.include?(position)
			print "Case occupée, sélectionne une autre case : "
			position = gets.chomp.to_s
		end
		while !@@position_possible.include?(position)
			print "Cette case n'existe pas, sélectionne une case valide : "
			position = gets.chomp.to_s
		end
		@@combinations << position
		@game.player_move(player, position)
		@show.display_board(@game.board.board_array)
	end

	#Ask for replay
	def ask_replay
		self.status
		print "Souhaitez-vous rejouer (Saisir 'Oui' si oui, n'importe quoi sinon)? "
		answer = gets.chomp.to_s
	end
		
	#Replay game
	def replay
			@game = Game.new(@name1, @name2)
			self.begin_game
	end

	#Display application statistics
	def status
		puts ""
		puts "Fin de la #{@@nb_games}e partie!"
		puts "#{@game.player1.name} a remporté #{@@player1_wins} parties."
		puts "#{@game.player2.name} a remporté #{@@player2_wins} parties."
		puts "Il a eu #{@@nb_draws} matches nuls."
		puts ""
	end

	#Perform first game and ask to replay at each end of game
	def perform
		self.begin_game
		while self.ask_replay.casecmp("oui") == 0
			self.replay
		end
	end

end




	
