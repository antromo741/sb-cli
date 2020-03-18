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
  #clean up code, make look neat
  #label everything
  
  def starting_menu
      puts "*Pokedex open*"
      puts "Welcome, I am your Pokedex...."
      puts "This is the main menu"
      puts "To look at some pokemon hit P"
      puts "To see a list of moves and their stats hit M"
      puts "To exit, type exit"
    end
    
    def pokedexsymbol
      
    end
    
  def pre_battle
    pokemon_array = [7,28,68,19,150]
    pokemon_array.map { |index| PokeCLI::API.get_pokemon(index)}
    moves_array = [1,2,3,4,5]
    moves_array.map { |index| PokeCLI::API.get_moves(index)}
    battle 
  end
  
  
      def battle
        #pokedexsymbol
          starting_menu
          input = gets.strip.downcase
          if input == "p" 
              pokedex
          elsif input == "m"
              poke_moves
          elsif input == "exit" 
              quit
          else 
              to_menu
        end
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
          #back method here
        puts "invalid back to main menu"
          battle
        end
          display_mons(choice)
        end 
  
      def display_mons(choice)
          @pokemon = PokeCLI::Pokemon.all[choice.to_i-1]
          puts "ID: #{@pokemon.id}"
          puts "Name: #{@pokemon.name.upcase}"
          puts "Base Experience: #{@pokemon.base_experience}"
          puts "Height: #{@pokemon.height}"
          puts "Weight: #{@pokemon.weight}"
     #wait method
          puts "Wanna see another pokemon?"
          puts "-------------------------"
          puts "For another mon press p"
          puts "To go back into the main menu hit a"
          puts "To quit type quit"
          input = gets.strip.downcase
          if input == "p"
              pokedex
          elsif input == "a"
              battle
          elsif input == "quit"
              quit
          else
              to_menu
          end
        end  
  
        def poke_moves
            puts "Heres a list of some moves"
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
                to_menu
            end
                display_moves(choice)
            end 

        def display_moves(choice)
          @moves = PokeCLI::Moves.all[choice.to_i-1]
          puts "Name: #{@moves.name.upcase} , Accuracy: #{@moves.accuracy} , PP: #{@moves.pp} , Power: #{@moves.power}"
          puts "Wanna see another move?"
          puts "for another move press m"
          puts " To go back into the main menu hit A"
          input = gets.strip.downcase
        if input == "m"
          poke_moves
        elsif input == "a"
          battle
        elsif input == "quit"
          quit
        else
          puts "try again"
          display_mons
        end
      end
   
    #  def display_stats
    # end
  
        def quit 
          puts "*Pokedex Off*"
        end 
    
        def to_menu
          puts "Invalid response back to Pokedex menu"
          battle
        end
    
#def pokedexsymbol
#end


  end
