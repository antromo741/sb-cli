#switch to pokemon
#lists stats 
 
 class PokeCLI::API 
   
    def self.get_pokemon(input)
      @pokemon_hash = HTTParty.get("https://api.kuroganehammer.com/api/characters/name/#{input}")
   
   
   
   
   
   
   poke_obj = {
     name: @pokemon_hash["Name"],
     game: @pokemon_hash["Game"]
   
     
   }
   PokeCLI::Pokemon.new(poke_obj)
   end
   
   
 end