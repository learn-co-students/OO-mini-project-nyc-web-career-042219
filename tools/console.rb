require_relative '../config/environment.rb'

recipe1 = Recipe.new("tuna")
recipe2 = Recipe.new("salmon")
recipe3 = Recipe.new("fish")

user1 = User.new("Jennifer")
user2 = User.new("Qun")
user3 = User.new("Bob")

recipecard1 = RecipeCard.new(user1, recipe1, 10, "17")
recipecard2 = RecipeCard.new(user2, recipe2, 7, "10")
recipecard3 = RecipeCard.new(user3, recipe1, 1, "27")
recipecard4 = RecipeCard.new(user3, recipe2, 8, "25")
recipecard5 = RecipeCard.new(user2, recipe3, 8, "25")
recipecard6 = RecipeCard.new(user1, recipe3, 8, "25")
recipecard7 = RecipeCard.new(user3, recipe3, 8, "25")


ingredient1 = Ingredient.new("tomato")
ingredient2 = Ingredient.new("potato")
ingredient3 = Ingredient.new("chip")

recipeingredient1 = RecipeIngredient.new(recipe1, ingredient1)
recipeingredient2 = RecipeIngredient.new(recipe2, ingredient2)
recipeingredient3 = RecipeIngredient.new(recipe3, ingredient3)


allergy1 = Allergy.new(user1, ingredient1)
allergy2 = Allergy.new(user2, ingredient2)
allergy3 = Allergy.new(user3, ingredient3)
allergy4 = Allergy.new(user2, ingredient1)
allergy5 = Allergy.new(user1, ingredient3)
allergy6 = Allergy.new(user2, ingredient3)

binding.pry
