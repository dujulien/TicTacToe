require 'pry'

class Show
	#attr_accessor :array

 	def display_board(array)
 		
 		#Première ligne
		puts ("     " + "1" + "  ") + ("  " + "2" + "  ") + ("  " + "3" + "  ")
		puts (" " *4) + ("- " * 7)
		puts (" A | " + (array[0]).value + " |") + ("| " + (array[1]).value + " |") + ("| " + (array[2]).value + " |")
		#Deuxième ligne
		puts (" " *4) + ("- " * 7)
		puts (" B | " + (array[3]).value + " |") + ("| " + (array[4]).value + " |") + ("| " + (array[5]).value + " |")
		#Troisième ligne
		puts (" " *4) + ("- " * 7)
		puts (" C | " + (array[6]).value + " |") + ("| " + (array[7]).value + " |") + ("| " + (array[8]).value + " |")
		puts (" " *4) + ("- " * 7)

	end

end
