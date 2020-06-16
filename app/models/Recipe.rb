class Recipe
attr_reader :recipe_name
@@all = []

  def initialize(recipe_name)
    @recipe_name = recipe_name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    freq = RecipeCard.all.group_by {|rc| rc.recipe}
    result = freq.sort_by {|k, v| -v.join.length}
    result[0][0]
  end

  def users
    all_rcs = RecipeCard.all.select {|rc| rc.recipe == self}
    all_rcs.map {|rc| rc.user}
  end

  def ingredients
    all_ris = RecipeIngredient.all.select {|ri| ri.recipe == self}
    all_ris.map {|ri| ri.ingredient}
  end

  def allergens
    result = []
    all_ingredients = self.ingredients
    all_ingredients.each do |ingredient|
      Allergy.all.each do |allergy|
        if allergy.ingredient == ingredient
          result << allergy.ingredient
        end
      end
    end
    result.uniq
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end
end
