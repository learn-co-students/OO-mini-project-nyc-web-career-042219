class Ingredient
  @@all = []

  def self.all
    @@all
  end

  def self.most_common_allergen
    Allergy.all.each_with_object({}) do |allergy, hash|
      hash[allergy.ingredient].nil? ? hash[allergy.ingredient] = 1 : hash[allergy.ingredient] += 1
    end.max_by(&:last)
  end

  attr_reader :name
  def initialize(name)
    @name = name
    @@all << self
  end
end
