class Recipe
  attr_accessor :name
  @@all_recipes = []

  def self.all
    @@all_recipes
  end

  def initialize(name)
    @name = name
    @@all_recipes << self
  end

  def my_cards
    RecipeCard.all.select {|card| card.recipe == self}
  end

  def self.most_popular
    all.max_by {|recipe| recipe.my_cards.length}
  end

  def self.most_popular2
    all.reduce do |memo, recipe|
      memo.my_cards.length > recipe.my_cards.length ? memo : recipe
    end
  end

  def ingredients
    RecipeIngredient.all.select {|ri| ri.recipe == self}.map {|ri| ri.ingredient}
  end

  def allergens
    ingredients.select do |ing|
      ing.my_allergens.count > 0
    end
  end

  def add_ingredients(ingredient)
    RecipeIngredient.new(self, ingredient)
  end

end
