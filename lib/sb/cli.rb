#cli controller
class SmashCLI::CLI
  

  #wanna take in input of a name 
  #will give few options, 
  #will give specific info
  #conditional if value works
  #exit command
  #menu to work 
  
  def call
    puts "hello world:"
    puts "GETTING DATA FROM API..... PLEASE DANCE"
    puts "CREATING NEW OBJS"
    display_info
  end
  
  
  def display_info
    puts "please make a selection"
    input = gets.strip.downcase
    
    if input == "player"
      puts "============Charachters-list============"
      puts "LIST OF PLAYERS/OBJECTS"
    elsif input == "game"
      puts "============GAME-LIST============"
      puts "LIST OF GAMES/OBJECTS"
      
    else
      puts "try again"
  end
end
  
end