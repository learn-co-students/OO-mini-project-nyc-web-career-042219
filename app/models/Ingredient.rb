require 'pry'
class Ingredient

@@all = []

  def self.all
    @@all
  end

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    ingredients = Allergy.all.map {|allergen| allergen.ingredient}
    counts = Hash.new(0)
    ingredients.each do |ingredient|
      counts[ingredient] += 1
    end
    counts.max_by{ |ingredient, count| count }[0]
  end


end
