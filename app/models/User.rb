class User
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    all_rcs = RecipeCard.all.select {|rc| rc.user == self}
    all_rcs.map {|rc| rc.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    all_allergens = Allergy.all.select {|allergy| allergy.user == self}
    all_allergens.map {|allergy| allergy.ingredient}
  end

  def top_three_recipes
    all_rcs = RecipeCard.all.select{|rc| rc.user == self}

    all_rcs.sort! {|a, b| b.rating <=> a.rating}
    all_rcs.map! {|rc| rc.recipe}
    all_rcs[0..2]
  end

  def most_recent_recipe
    all_rcs = RecipeCard.all.select{|rc| rc.user == self}

    all_rcs.sort! {|a, b| a.date <=> b.date}
    all_rcs[-1].recipe
  end

  def self.all
    @@all
  end
end
