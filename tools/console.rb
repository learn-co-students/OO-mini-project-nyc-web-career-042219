require_relative '../config/environment.rb'

user = User.new("alice")
user2 = User.new("bob")
user3 = User.new("jim")

ingredient = Ingredient.new("carrot")
ingredient2 = Ingredient.new("potatoe")

allergy = Allergy.new(user, ingredient)
allergy2 = Allergy.new(user2, ingredient2)
allergy3 = Allergy.new(user2, ingredient)

recipe = Recipe.new("Pasta")
recipe2 = Recipe.new("Cake")
recipe3 = Recipe.new("Cake")


card = RecipeCard.new(recipe, user, 5)
card2 = RecipeCard.new(recipe2, user2, 3)
card3 = RecipeCard.new(recipe, user3, 4)

r_ingredient = RecipeIngredient.new(recipe, ingredient)
r_ingredient2 = RecipeIngredient.new(recipe2, ingredient2)

binding.pry
