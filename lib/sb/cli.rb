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
  #heal 
  #clean up code, make look neat
  #label everything
  #reorder everything
  
  
  def pre_battle
    pokemon_array = [7,28,68,19,150]
    pokemon_array.map { |index| PokeCLI::API.get_pokemon(index)}
    moves_array = [1,2,3,4,5]
    moves_array.map { |index| PokeCLI::API.get_moves(index)}
    battle 
  end
  
  def starting_menu
   
    loading
   
      puts "*Pokedex open*"
      sleep 1
      puts "Welcome, I am your Pokedex...."
      sleep 1
      puts "This is the main menu."
      sleep 1
      puts "To look at some pokemon type P."
      sleep 1
      puts "To see a list of moves and their stats type M."
      sleep 1
      puts "To exit the program, type exit."
    end
    
    def pokedexsymbol
      
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
        loading
          puts "Heres a list of some pokemon"
          sleep 1
            PokeCLI::Pokemon.all.each.with_index(1) do |poke, index|
          puts "#{index}. #{poke.name}"
          sleep 1
        end
          sleep 1
            puts "To find out more information choose the id number."
          sleep 1
            puts "To exit type exit."
          input = gets.strip.downcase
    
        if ("1".."10").include?(input)
          choice = input.to_i
        elsif input == "exit"
          quit
        else
          
        puts "invalid option try again or type exit"
          pokedex
        end
          display_mons(choice)
        end 
  
      def display_mons(choice)
          @pokemon = PokeCLI::Pokemon.all[choice.to_i-1]
          sleep 1
          puts "ID: #{@pokemon.id}"
          sleep 1
          puts "Name: #{@pokemon.name.upcase}" 
          sleep 1
          puts "Base Experience: #{@pokemon.base_experience}"
          sleep 1
          puts "Height: #{@pokemon.height}" 
          sleep 1
          puts "Weight: #{@pokemon.weight}"
          sleep 1
          puts "-------------------------"
          puts "Wanna see another pokemon?"
          puts "-------------------------"
          puts "For another Pokemon press P."
          sleep 1
          puts "To go back into the main menu hit A."
          sleep 1
          puts "To quit the program type exit."
          input = gets.strip.downcase
          if input == "p"
              pokedex
          elsif input == "a"
              battle
          elsif input == "exit"
              quit
          else
              to_pokedex
          end
        end  
  
        def poke_moves
            puts "Heres a list of some moves!"
            PokeCLI::Moves.all.each.with_index(1) do |moves, index|
              sleep 1
            puts "#{index}. #{moves.name}"
        end
              sleep 1
            puts "To find out more information choose the id number."
              sleep 1
            puts "To exit the program type exit."
            input = gets.strip.downcase
    
            if ("1".."10").include?(input)
                choice = input.to_i
            elsif input == "exit"
                quit
            else
                to_moves
            end
                display_moves(choice)
            end 

        def display_moves(choice)
          @moves = PokeCLI::Moves.all[choice.to_i-1]
          sleep 1
          puts "Name: #{@moves.name.upcase} , Accuracy: #{@moves.accuracy} , PP: #{@moves.pp} , Power: #{@moves.power}"
          sleep 1
          puts "-------------------------"
          sleep 1
          puts "Do you want to choose another move?"
          sleep 1
          puts "For another move type M"
          sleep 1
          puts "To go back into the main menu type A"
          input = gets.strip.downcase
        if input == "m"
          poke_moves
        elsif input == "a"
          battle
        elsif input == "exit"
          quit
        else
          puts "try again"
          display_moves
        end
      end
   
        def loading                     #giving the menu loading times to make it look cleaner and more realistic
          sleep 1
          puts "*Pokedex Proccessing*"
          sleep 1
          puts "Loading..."
          sleep 1
        end
        
        def quit 
          #loading                                            #simple quit method
          puts "*Pokedex Off*"
          exit
        end 
    
        def to_menu                                           #Error message for invalid response
          puts "Invalid response back to Pokedex menu"
          battle
        end
        
        def to_pokedex                                        #Error message for wrong pokemon selection
          puts "Invalid response, try again or type exit."
          pokedex
        end
        
        def to_moves
          puts "Invalid response, try again or type exit."
          poke_moves
        end
        
  end