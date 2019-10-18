require 'pry'

class Show
	#attr_accessor :array

 	def display_board(array)
 		#Empty shell
 		system 'clear'
 		
 		#Display tictactoe logo and welcome message in light blue
 		file = File.read('lib/views/morpion')
		puts file.colorize(:light_blue)
		puts "BIENVENU.E.S DANS LE MEILLEUR JEU DE MORPION !".colorize(:light_blue)
		puts ""
 		
 		#Display tictactoe grid
 		#First line
		puts ("     " + "1" + "  ") + ("  " + "2" + "  ") + ("  " + "3" + "  ")
		puts (" " *4) + ("- " * 7)
		puts (" A | " + (array[0]).value + " |") + ("| " + (array[1]).value + " |") + ("| " + (array[2]).value + " |")
		#Second line
		puts (" " *4) + ("- " * 7)
		puts (" B | " + (array[3]).value + " |") + ("| " + (array[4]).value + " |") + ("| " + (array[5]).value + " |")
		#Third line
		puts (" " *4) + ("- " * 7)
		puts (" C | " + (array[6]).value + " |") + ("| " + (array[7]).value + " |") + ("| " + (array[8]).value + " |")
		puts (" " *4) + ("- " * 7)
	end

end
