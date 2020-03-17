#switch to pokemon pokedex


class PokeCLI::Pokemon
  attr_accessor :name, :id
  @@all = []
  
 def initialize(hash)
    hash.each {|key, value| self.send(("#{key}="), value)}
    save 
  end


  def self.all 
  @@all
  end
  
  def save
    self.class.all << self
  end

end