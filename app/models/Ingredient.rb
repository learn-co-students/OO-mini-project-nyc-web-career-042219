class Ingredient
  attr_accessor :name
  @@all_ingredients = []

  def self.all
    @@all_ingredients
  end

  def initialize(name)
    @name = name
    @@all_ingredients << self
  end

  def my_allergens
    Allergy.all.select {|al| al.ingredient == self}
  end

  def whose_allergic
    my_allergens.map {|al| al.user}
  end

  def self.most_common_allergen
    all.reduce {|memo, ing| memo.my_allergens.count > ing.my_allergens.count ? memo : ing }
  end

end
