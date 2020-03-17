

class PokeCLI::Moves
  attr_accessor :name, :accuracy, :pp, :power
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