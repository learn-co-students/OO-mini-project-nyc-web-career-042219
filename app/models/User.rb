class User
  attr_accessor :name
  @@all_users = []

  def self.all
    @@all_users
  end

  def initialize(name)
    @name = name
    @@all_users << self
  end

  def recipe_cards
    RecipeCard.all.select {|rc| rc.user == self}
  end

  def recipes
    recipe_cards.map {|rc| rc.recipe}
  end

  def add_recipe_card(recipe)
    RecipeCard.new(self, recipe)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    Allergy.all.select {|al| al.user == self}
  end

  def sorted_recipes_by_rating
    recipes.sort_by do |rec|
      rec.rating
    end.reverse
  end

  def top_three_recipes
    top_three_recipes = []
    3.times do |i|
      top_three_recipes << sorted_recipes_by_rating[i]
    end
    top_three_recipes
  end

  def most_recent_recipe
    recipe_cards.reduce do |a, b|
      a.date > b.date ? a : b
    end.recipe
  end

  def safe_recipes
    recipe_cards.reject do |rc|
      rc.recipe.ingredients.any? {|ing| ing.whose_allergic.include? self}
    end.map {|rc| rc.recipe}
  end

end
