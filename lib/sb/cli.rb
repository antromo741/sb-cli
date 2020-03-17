#cli controller
class SmashCLI::CLI
  #will do each game, api has stuff for all. you just add/ultimate or /melee 
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
    input = gets.strip.downcase
    @data = SmashCLI::API.get_characters(input)
    @objects = SmashCLI::Character.all
   puts "player"
    display_info
  end
  
  
  def display_info
    puts "want to know more "
    @objects.each.with_index(1) {|player, index| puts "#{index}. #{player.name} is from #{player.game}"}

   
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
  