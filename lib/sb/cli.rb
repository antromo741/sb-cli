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
    pokemon_array = [1,2,3,4,5]
    pokemon_array.map { |index| PokeCLI::API.get_pokemon(index)}
    battle 
  end
  def battle
    #pokedexsymbol
     puts "pokedex open"
     puts "choose p for pokedex"
     input = gets.strip.downcase
    if input == "p" 
    pokedex
  else 
    quit
  end
  end
  #
  
  def pokedex
  #  
  # @objects = PokeCLI::Pokemon.all
  
   puts "choose a mon yo"
    input = gets.strip.downcase
    PokeCLI::API.get_pokemon(input)
    puts "Is this the pokemon you were looking for?!"
    PokeCLI::Pokemon.all.each.with_index(1) do |poke, index|
    puts "#{index}. #{poke.name}"
    end
    puts "If so, please type Y or N"
    input = gets.strip.downcase
    if input == "y"
        PokeCLI::Pokemon.all.each.with_index(1) do |pokemon, index|
        puts "#{index}. #{pokemon.name}. #{pokemon.id}"
    end
  elsif input == "n"
    battle
  else
    quit
  end
    
  end 

  def quit 
    puts "Goodbye"
  end 

#def pokedexsymbol
#end


end
