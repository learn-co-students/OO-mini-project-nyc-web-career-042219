class Ingredient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    freq = Allergy.all.group_by {|allergy| allergy.ingredient}
    freq.max_by {|k, v| -v.join.length}
  end
end
