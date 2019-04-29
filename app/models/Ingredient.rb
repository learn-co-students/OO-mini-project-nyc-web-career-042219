class Ingredient
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    Allergy.all.uniq.sort_by do |allergen|
      Allergy.all.count(allergen)
    end.last.ingredient
  end


  def self.all
    @@all
  end







end
