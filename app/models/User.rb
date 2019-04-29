class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    RecipeCard.all.select {|recipe_card| recipe_card.user == self}
  end

  def add_recipe_card(recipe, rating, date)
    RecipeCard.new(self, recipe, rating, date)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    x = Allergy.all.select do |allergen|
      allergen.user == self
    end
    x.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    recipes = self.recipes
    x = recipes.max_by(3) do |recipe_card|
      recipe_card.rating
    end
    x.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def most_recent_recipe
    RecipeCard.all.last.recipe
  end

  def safe_recipes
    a = self.allergens
    y = RecipeIngredient.all.reject do |rec_ing|
      a.map do |a|
        a == rec_ing.ingredient
      end.find{|word| word == true}
    end
    y.map do |rec_ing|
      rec_ing.ingredient
    end
  end



  def self.all
    @@all
  end

end
