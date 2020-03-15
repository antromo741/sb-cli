#cli controller
class SmashCLI::CLI
  
  def call
    puts "hello world:"
    puts "GETTING DATA FROM API..... PLEASE DANCE"
   # @data = SmashCLI::API.get_data
    #@objects = SmashCLI::CHARACTER.all 
    display_info
  end
  
  
  def display_info
    puts "please make a selection"
   # @objects.each do |obj|
    #  puts "#{obj.name} -#{obj.age}"
    #end
    
    input = gets.strip.downcase
   
    if input == "player"
      puts "============Charachters-list============"
      puts "LIST OF PLAYERS/OBJECTS"
      #@obj = @objects[0]
     # puts "#{obj.salary}, #{obj.upcoming_film}"      
      display_info
      
    elsif input == "game"
      puts "============GAME-LIST============"
      puts "LIST OF GAMES/OBJECTS"
      display_info
      
    else
      puts "goodbye"
  end
end
  #make a restart method for wrong inputs
  #set exit to exit menu instead of goodbye
end