#switch to pokemon pokedex


class SmashCLI::Character
  attr_accessor :name, :game
  @@all =[]
  
 def initialize(hash)
    hash.each {|key, value| self.send(("#{key}="), value)}
    save 
  end


  def self.all 
  @@all
  end
  
  def save
    @@all << self
  end

end