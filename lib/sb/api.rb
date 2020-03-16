# find an api to use 
#find a url and set it 
#build some hashes for obj 
#call custom class . new method 
# send those back to our cli 
 
 
 class SmashCLI::API 
   
    def self.get_characters(input)
      @characters_hash = HTTParty.get("https://api.kuroganehammer.com/api/characters/name/#{input}")
   
   
   char_obj = {
     name: @characters_hash["Name"],
     game: @characters_hash["Game"],
    # moves: @characters_hash["Moves"]
     
   }
   SmashCLI::Character.new(char_obj)
   end
   
   
 end