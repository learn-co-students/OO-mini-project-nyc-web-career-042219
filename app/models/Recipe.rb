require 'pry'
class Recipe
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def user
    RecipeCard.all.select {|recipe_card| recipe_card.recipe == self}
  end

  def self.most_popular
    RecipeCard.all.uniq.sort_by do |recipe_card| #find all unique values of the RecipeCard Class (array), which will give you all unique recipe_cards.
      RecipeCard.all.count(recipe_card) #Sort recipe_card by count, in ascending order
    end.last.recipe #get last array and select the recipe
  end

  def ingredients
    RecipeIngredient.all.find do |recipe_ing|
      recipe_ing.recipe == self
    end.ingredient
  end

  def allergens
    i = self.ingredients
    x = Allergy.all.select do |allergen|
      allergen.ingredient == i
    end
    x.map do |allergen|
      allergen.ingredient.uniq
    end
  end

  def add_ingredients(ingredient)
    RecipeIngredient.new(self, ingredient)
  end



  def self.all
    @@all
  end

end
