class Dog
  attr_accessor :owner , :mood 
  attr_reader :name 
  @@all = []
  def initialize(name, owner)
    
    # Are these methods or instance variables .
    @name = name 
    @owner = owner
    @mood = 'nervous'
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
end
