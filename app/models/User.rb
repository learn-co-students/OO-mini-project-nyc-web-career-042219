class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    recipe_card_for_user = RecipeCard.all.select { |rc| rc.user == self}
    recipe_card_for_user.collect { |rc| rc.recipe }
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens
    Allergy.all.select { |allergy| allergy.user == self}
  end

  def top_three_recipes
    cards = RecipeCard.all.select { |rc| rc.user == self}
    top_cards = cards.sort_by! { |rc| rc.rating}.reverse
    top_cards.slice(0..2)
  end

  def most_recent_recipe
    recipe_card_for_user = RecipeCard.all.select { |rc| rc.user == self}
    recipe_card_for_user.sort_by! { |rc| rc.date}.last
  end

end
