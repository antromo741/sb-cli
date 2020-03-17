#cli controller
class PokeCLI::CLI
 
  #make a restart method for wrong inputs
  #set exit to exit menu instead of goodbye
  #THINGS I NEED 
  #menu with user interface
  #brings you to a pokedex, first 151 pokemon
  #displays type, hp, attack, spec attack, def, spec def, speed
  #build a team 
  #menu displays a pokeball or something 
  #battle lol 
  #heal 
  
  
  
  def pre_battle
    pokemon_array = [7,28,68,19,150]
    pokemon_array.map { |index| PokeCLI::API.get_pokemon(index)}
    moves_array = [1,2,3,4,5]
    moves_array.map { |index| PokeCLI::API.get_moves(index)}
    battle 
  end
  
  
  def battle
    #pokedexsymbol
     puts "Pokedex open"
     puts "To look at some pokemon hit P"
     puts "To see a list of moves and their stats hit M"
     puts "To exit, type exit"
     input = gets.strip.downcase
    if input == "p" 
    pokedex
    elsif input == "m"
    poke_moves
  elsif input == quit 
    quit
  else 
    puts "not an option back in the main menu"
    battle
  end
  end
  
  
  def poke_moves
     puts "Heres a list of some pokemon"
    PokeCLI::Moves.all.each.with_index(1) do |moves, index|
    puts "#{index}. #{moves.name}"
    end
    puts "To find out more information choose the id number"
    puts " to exit type quit"
    input = gets.strip.downcase
    
    if ("1".."10").include?(input)
      choice = input.to_i
  elsif input == "quit"
    quit
  else
    battle
  end
    display_moves(choice)
  end 
  
  
  def pokedex
    puts "Heres a list of some pokemon"
    PokeCLI::Pokemon.all.each.with_index(1) do |poke, index|
    puts "#{index}. #{poke.name}"
    end
    puts "To find out more information choose the id number"
    puts " to exit type quit"
    input = gets.strip.downcase
    
    if ("1".."10").include?(input)
      choice = input.to_i
  elsif input == "quit"
    quit
  else
    battle
  end
    display_mons(choice)
  end 
  
  def display_mons(choice)
     @pokemon = PokeCLI::Pokemon.all[choice.to_i-1]
     puts "ID: #{@pokemon.id} , Name: #{@pokemon.name.upcase} , Base Experience: #{@pokemon.base_experience} , Height: #{@pokemon.height} , Weight: #{@pokemon.weight}"
     #wait method
     puts "Wanna see another pokemon?"
   end
   
   def display_moves(choice)
     @moves = PokeCLI::Moves.all[choice.to_i-1]
     puts "Name: #{@moves.name.upcase} , Accuracy: #{@moves.accuracy} , PP: #{@moves.pp} , Power: #{@moves.power}"
   end
   
  #  def display_stats
  # end
  
  def quit 
    puts "Goodbye"
  end 

#def pokedexsymbol
#end


end
