class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species 
    "I am a human."
  end

  def self.all 
    @@all
  end

  def self.count 
    self.all.count
  end

  def self.reset_all 
    self.all.clear
  end

  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs 
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(new_cat)
    new_cat = Cat.new(new_cat, self)
  end 

  def buy_dog(new_dog)
    new_dog = Dog.new(new_dog, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats 
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets 
    #calculate all the pets 
    pets = self.cats + self.dogs 

    #change pets moods 
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end