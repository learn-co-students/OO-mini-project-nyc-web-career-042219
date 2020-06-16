class Recipe
  attr_reader :name
  @@all = []

  def initialize(name)
    @recipe_name = recipe_name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    RecipeCard.all.group_by {|rc| rc.recipe}.max_by {|k, v| -v.join.length}
  end

  def users
    RecipeCard.all.select {|rc| rc.recipe == self}.map {|rc| rc.user}
  end

  def ingredients
    RecipeIngredient.all.select {|ri| ri.recipe == self}.map {|ri| ri.ingredient}
  end

  def allergens
    result = []
    self.ingredients.each do |ingredient|
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
