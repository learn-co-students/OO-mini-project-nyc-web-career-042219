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
    just_ingredients = Allergy.all.map { |allergy| allergy.ingredient}
    freq = just_ingredients.inject(Hash.new(0)) { |h,v| h[v] += 1; h } #get a clearer understanding of how this works
    just_ingredients.max_by { |v| freq[v] }
  end

end
