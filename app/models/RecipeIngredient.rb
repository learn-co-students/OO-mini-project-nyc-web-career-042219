class RecipeIngredient
  attr_accessor :recipe, :ingredient
  @@all_rec_ings = []

  def self.all
    @@all_rec_ings
  end

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all_rec_ings << self
  end

end
