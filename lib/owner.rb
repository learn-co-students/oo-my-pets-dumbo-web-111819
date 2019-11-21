require 'pry'
require_relative 'cat'
require_relative 'dog'

class Owner
@@all = []
  attr_reader :name, :species, :new_cat

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
   "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|indivi_cat|
      indivi_cat.owner == self
    }
  end

  def dogs
    Dog.all.select {|indivi_dog|
      indivi_dog.owner == self
    }
  end

  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end 

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end 

end