class Owner
  attr_reader :name, :species
  
  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end

  def species
    @species
  end

  def say_species
    p "I am a #{self.species}."
  end

  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all = []
  end 
  
  def cats
    owner_cats = Cat.all.select do |cat|
    cat.owner == self
    end
    owner_cats
  end
  
  def dogs
    owner_dogs =Dog.all.select do |dog|
      dog.owner == self
    end
    owner_dogs
  end
  
  def buy_cat(name)
    Cat.new(name,self)
  end 
  
  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end