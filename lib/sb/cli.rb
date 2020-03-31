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
  #clean up code, make look neat
  #label everything
  #reorder everything
  #wrong id input failure need to fix
  
  def pre_battle
    pokemon_array = [7,28,68,19,150]                              #here you can change what mons are listed
    pokemon_array.map { |index| PokeCLI::API.get_pokemon(index)}
    moves_array = [1,2,3,4,5]
    moves_array.map { |index| PokeCLI::API.get_moves(index)}      #you can also change what moves are listed
    pokedexsymbol
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
    #ruby cant read \ need to fix
    def pokedexsymbol
        puts Rainbow("     __________________     ").red
        puts Rainbow("    /                  \    ").red
        puts Rainbow("   /                    \   ").red
        puts Rainbow("  /                      \  ").red
        puts Rainbow(" /_________/----\ _________\ ").black 
        puts Rainbow(" |_________  ()  _________| ").black
        puts Rainbow(" \           \----/        / ").black
        puts Rainbow("  \                      /  ").white
        puts Rainbow("   \                    /   ").white
        puts Rainbow("    \__________________/    ").white
    end
    #menu sequence
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
  
  
  #pokemon part of the code
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
    
        if ("1".."5").include?(input)      #can change this to include a larger selection if I allowed array to be bigger
          choice = input.to_i
        elsif input == "exit"
          quit
        else
          sleep 1 
          to_pokedex
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
            sleep 1
              to_pokedex
          end
        end  
  
  
  #Moves section of code
  
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
    
            if ("1".."5").include?(input)
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
          puts "-----------------------------------"
          puts "Do you want to choose another move?"
          puts "-----------------------------------"
          sleep 1
          puts "For another move type M"
          sleep 1
          puts "To go back into the main menu type A"
          sleep 1
          puts "To exit the program, type exit."
          input = gets.strip.downcase
        if input == "m"
          poke_moves
        elsif input == "a"
          battle
        elsif input == "exit"
          quit
        else
          to_moves
        end
      end
   
   
   #All of my different errors and loading screens
        def loading                     #giving the menu loading times to make it look cleaner and more realistic
          sleep 1
          puts Rainbow("*Pokedex Proccessing*").green
          sleep 1
          puts Rainbow("Loading...").green
          sleep 1
        end
        
        def quit 
          #loading                                            #simple quit method
          puts Rainbow("*Pokedex Off*").red
          exit
        end 
    
        def to_menu                                           #Error message for invalid response
          puts Rainbow("Invalid response back to Pokedex menu").yellow
          battle
        end
        
        def to_pokedex                                        #Error message for wrong pokemon selection
          sleep 1
          puts Rainbow("Invalid response, try again or type exit.").yellow
          pokedex
        end
        
        def to_moves
          sleep 1
          puts Rainbow("Invalid response, try again or type exit.").yellow
          poke_moves
          sleep 1
        end
        
  end