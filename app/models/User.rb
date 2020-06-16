require 'pry'
class User

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    RecipeCard.all.select { |recipecard| recipecard.user == self }
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    Allergy.all.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    # if recipes.length < 3
    #   recipes.recipe
    # else
      ratings = recipes.sort_by {|recipe| recipe.rating }
      ratings.map { |recipe| recipe.recipe }.slice(-3, 3)
  end

  def most_recent_recipe
    most_recent = RecipeCard.all.select {|card| card.user == self}
    most_recent.last
  end






# start at user
# end at recipe
# return all safe recipes that do not contain user's allergic ingredients
  def safe_recipes
    # userallergies = Allergy.all.select { |allergy| allergy.user == self }
    # allergicingredients = userallergies.map { |allergy| allergy.ingredient }
    # recipeingredients = RecipeIngredient.all.map { |ri| ri.ingredient }
    # exclude = allergicingredients & recipeingredients
    # x = RecipeIngredient.all.select { |ri| ri.ingredient }
    # safeingredients = allergicingredients -  recipeingredients | recipeingredients - allergicingredients
    # x = RecipeIngredient.all.select { |ri| safeingredients.include?(ri.ingredient) }
    # x.map { |thing| thing.recipe }


    RecipeIngredient.all.select { |ri| ri.ingredient } #all recipe ingredients
    binding.pry
    avoid_ingredients_arr = self.allergens.map { |allergy| allergy.ingredient } # arr of ingredients to avoid
    # iterate over arr
    avoid_ingredients_arr.each do |ingredient|
      ingredient
    end

    avoid_ingredients_arr.select do |avoid_ingredient|
      RecipeIngredient.all.each { |ri| ri != avoid_ingredient ? ri.recipe : nil}
    end
  end


  def allergens
    ingredients
    x = User.all.map { |user| user.allergens }.flatten
    y = x.map { |allergy| allergy.ingredient }
    ingredients & y
  end







end
