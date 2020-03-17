#look for stuff I can add
#perhaps pokeball or maybe other stats
 class PokeCLI::API 
   
    def self.get_pokemon(input)
      @pokemon_hash = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{input}/")
  poke_obj = {
    
    name: @pokemon_hash["name"],
    id: @pokemon_hash["id"],
    base_experience: @pokemon_hash["base_experience"],
    height: @pokemon_hash["height"],
    weight: @pokemon_hash["weight"],
   
     
   } 
  
   PokeCLI::Pokemon.new(poke_obj)
   end
   
   def self.get_moves(input)
      @pokemon_move_hash = HTTParty.get("https://pokeapi.co/api/v2/move/#{input}/")
  move_obj = {
    
    name: @pokemon_move_hash["name"],
    accuracy: @pokemon_move_hash["accuracy"],
    pp: @pokemon_move_hash["pp"],
    power: @pokemon_move_hash["power"],
    
   
     
   } 
  
   PokeCLI::Moves.new(move_obj)
   end
   
   #def self.get_type
   #end 
   
  
   
 end