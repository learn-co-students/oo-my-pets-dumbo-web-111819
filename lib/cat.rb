require_relative 'owner.rb'
require 'pry'

class Cat
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"

    @@all << self

    #binding.pry
  end

  def self.all
    @@all
  end

  

end