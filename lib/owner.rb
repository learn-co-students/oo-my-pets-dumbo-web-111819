require_relative "./cat.rb"
require_relative "./dog.rb"
require 'pry'
class Owner
    
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    # @species = species
  end
  
  def species 
    @species = 'human'
  end 
  
  def say_species
    return "I am a #{species}."
  end
  
  def self.all 
    @@all
  end
  
  
  
  def self.count
    @@all.length
  end
  
  def self.reset_all 
    @@all =[]
  end
  
  def cats
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end
  
  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end
  
  def buy_cat(name)
    @buy_cat = Cat.new(name,self) ### ask question to instructor 
  end
  
  def buy_dog(name)
    @buy_dog = Dog.new(name,self)
  end
  
  def walk_dogs
    dogs.each do |owner_dogs|
      owner_dogs.mood = 'happy'
    end
  end
  
  def feed_cats
    cats.each do |owner_cats|
      owner_cats.mood = 'happy'
    end
  end
  
  def sell_pets
    cats.each do |cat_instance| 
      cat_instance.mood = 'nervous'
    end
    dogs.each do |dog_instance|
      dog_instance.mood ='nervous'
    end
    
    cats.each do |cat_instance| 
      cat_instance.owner = nil
    end
    dogs.each do |dog_instance|
      dog_instance.owner = nil
    end
  end
  
  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    
  end
end
#binding.pry