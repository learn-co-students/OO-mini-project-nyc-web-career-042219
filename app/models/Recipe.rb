class Recipe
  @@all = []

  def self.all
    @@all
  end

  def self.most_popular
    RecipeCard.all.each_with_object({}) do |card, hash|
      hash[card.recipe].nil? ? hash[card.recipe] = 1 : hash[card.recipe] += 1
    end.max_by(&:last)
  end

  attr_reader :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    retrieve_recipe_card.map(&:user)
  end

  def ingredients
    retrieve_recipe_ingredients.map(&:ingredient)
  end

  def allergens
    ingredients.select do |ingredient|
      Allergy.all.map(&:ingredient).uniq.include?(ingredient)
    end
  end

  def add_ingredients(ingredients)
    ingredients.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end

  private

  def retrieve_recipe_ingredients
    RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
  end

  def retrieve_recipe_card
    RecipeCard.all.select { |card| card.recipe == self }
  end


end