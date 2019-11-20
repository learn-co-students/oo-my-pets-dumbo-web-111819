class Owner
    attr_reader :name , :species
  @@all = []
  
    def initialize(name)
      # Initialize the species variable to be 'human'.
      # 
    @species = "human"
        @name = name
        @@all << self
    end 
    
    def say_species
      "I am a human."
    end 
    
    def self.all # Self -> class
      @@all 
    end 
    
    def self.count
        @@all.length 
    end
    
  def self.reset_all
     @@all.clear 
  end
  # This method should return an array of cats that belongs to particular owner. 
  
  def cats
    # calls cat.all variables, and returns them according to owner instance name.
    # Returns the specific owner's cats. 
    
    Cat.all.select do |cats_instances|
      cats_instances.owner == self 
    end 
    
  end
  
  def dogs # Returns the particular owner's current dogs array. 
    # calls cat.all variables, and returns them according to owner instance name.
    
    Dog.all.select do |dogs_instances|
      # Looop thorught the cats array in Cat, and find the same user instance, then return the cats that matches the owner
      dogs_instances.owner == self 
    end 
  end 
  
  def buy_cat(cat_name)
      Cat.new(cat_name, self)
  end 
  def buy_dog(dog_name)
      Dog.new(dog_name, self)
  end 
  
  def walk_dogs
    self.dogs.map do |dogs_instances|
      dogs_instances.mood = "happy"
    end 
  end 
  
  def feed_cats
    self.cats.map do |cats_instances|
      cats_instances.mood = "happy"
    end 
  end 
  
  def sell_pets
    combined_pets = self.dogs + self.cats 
    combined_pets.map do |pets_instances|
      pets_instances.mood = "nervous"
      pets_instances.owner = nil 
    end 
  end 
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  
end # End of Ownder class
