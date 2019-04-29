class User
  @@all = []

  def self.all
    @@all
  end

  attr_reader :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    retrieve_recipe_card.map(&:recipe)
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(recipe, self, rating)
  end

  def declare_allergy(ingredient)
    Allergy.new(self,ingredient)
  end

  def allergens
    retrieve_allergies.map(&:ingredient)
  end

  def top_three_recipes
    retrieve_recipe_card.sort_by(&:rating).reverse.take(3).map(&:recipe)
  end

  def most_recent_recipe
    recipes.last
  end

  def safe_recipes
    Recipe.all.reject { |recipe| recipe.allergens == allergens }
  end

  private

  def retrieve_allergies
    Allergy.all.select { |allergy| allergy.user == self }
  end

  def retrieve_recipe_card
    RecipeCard.all.select { |card| card.user == self }
  end

end