class RecipeIngredient

  attr_reader :ingredient, :recipe

  @@all = []

  def initialize(recipe, ingredient)
    @ingredient = ingredient
    @recipe = recipe
    @@all << self
  end


  def self.all
    @@all
  end



end
