class Recipe

  attr_reader :ingredients, :name

@@all = []

def initialize(name)
  @name = name
  @ingredients = []
  @@all << self
end

def add_ingredients(ingredients)
  @ingredients=ingredients
end

def self.all
  @@all
end

 def self.most_popular
   self.all.max { |a, b| a.users.length <=> b.users.length }
 end

 def users
   RecipeCard.all.map {|recipecard| recipecard.user if self == recipecard.recipe}
 end

 def allergens
   self.users.map {|user| user.allergens}
 end

end
