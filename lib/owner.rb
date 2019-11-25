require 'pry'
require_relative 'cat'
require_relative 'dog'

class Owner
  attr_reader :name, :species #, :cats, :dogs
  
  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    # @cats = []
    # @dogs = []
    self.class.all << self
  end

  def cats
    Cat.all.select{|cat|cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog|dog.owner == self}
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

  def say_species
    "I am a #{@species}."
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each{ |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.dogs.each{ |dog| dog.mood = "nervous"
     dog.owner = nil }
    self.cats.each{ |cat| cat.mood = "nervous"
     cat.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end


# owner1 = Owner.new('owner1')
# owner2 = Owner.new('owner2')

# cat1 = owner1.buy_cat('cat1')
# dog1 = owner2.buy_dog('dog1')

# binding.pry
