#switch to pokemon
#lists stats 
 
 class PokeCLI::API 
   
    def self.get_pokemon(input)
      @pokemon_hash = HTTParty.get("https://pokeapi.co/api/v2/pokemon-form/#{input}/")
      #binding.pry
   poke_obj = {
    name: @pokemon_hash["name"],
    id: @pokemon_hash["id"],
    base_experience: @pokemon_hash["base_experience"],
    height: @pokemon_hash["height"],
    weight: @pokemon_hash["weight"]
   
     
   } 
  
   PokeCLI::Pokemon.new(poke_obj)
   end
   
   #def self.get_type
   #end 
   
   #def self.get_moves
   #end
   
 end