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
  
  
  
  def battle
    #pokedexsymbol
     puts "pokedex open"
    input = gets.strip.downcase
    @data = PokeCLI::API.get_pokemon(input)
    @objects = PokeCLI::Pokemon.all
  
    pokedex
  end
  
  
  def pokedex
    puts "choose a mon yo"
    PokeCLI::Pokemon.all.each.with_index(1) {|pokemon, index| puts "#{pokemon.id}. #{pokemon.name}  "}

   
    puts "please make a selection by index number:"
    
input = gets.strip.downcase
   
         if (input.to_i > 0)
        
     @player = @objects[input.to_i - 1]
      
      puts "#{@player.name}" 
      #binding.pry
      #display_info
      
    elsif (input == "quit")
      quit
      
    elsif (input == "menu")
      start
    else 
      puts "Oops"
      display_info
    end 
    
  end 

  def quit 
    puts "Goodbye"
  end 

#def pokedexsymbol
#end


end
  