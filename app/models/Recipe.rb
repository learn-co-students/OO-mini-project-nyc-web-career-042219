class Recipe

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes_from_card #this returns an array of recipe card for the given recipe
    RecipeCard.all.select { |rc| rc.recipe == self }
  end

  def users
    self.recipes_from_card.collect { |recipe| recipe.user }
  end

  def recipes_from_rec_ingred #this returns an array recipe_ingredents for the recipe
    RecipeIngredient.all.select { |ri| ri.recipe == self}
  end

  def ingredients #this returns a list of ingredients for a recipe
    self.recipes_from_rec_ingred.collect { |ri| ri.ingredient}
  end

  def allergens
    allergens_in_recipe = []
    self.ingredients.each do |ingredient|
      if Allergy.all_allergens.include?(ingredient) == true
        allergens_in_recipe << ingredient
      end
    end
    allergens_in_recipe
  end

  def add_ingredients(array)
    array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def self.most_popular
    just_recipes = RecipeCard.all.map { |rc| rc.recipe}
    freq = just_recipes.inject(Hash.new(0)) { |h,v| h[v] += 1; h } #get a clearer understanding of how this works
    just_recipes.max_by { |v| freq[v] }
  end

end
