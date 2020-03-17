#switch to pokemon
#lists stats 
 
 class SmashCLI::API 
   
    def self.get_characters(input)
      @characters_hash = HTTParty.get("https://api.kuroganehammer.com/api/characters/name/#{input}")
   
   
   
   
   
   
   char_obj = {
     name: @characters_hash["Name"],
     game: @characters_hash["Game"]
   
     
   }
   SmashCLI::Character.new(char_obj)
   end
   
   
 end