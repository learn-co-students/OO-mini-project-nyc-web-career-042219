require_relative '../config/environment.rb'

#USERS
jake = User.new("Jake")
arslan = User.new("Arslan")
picard = User.new("Picard")

#RECIPES
pizza_recipe = Recipe.new("Pizza")
sandwich_recipe = Recipe.new("Sandwich")
omelette_recipe = Recipe.new("Omelette")
soup_recipe = Recipe.new("Soup")

#RECIPECARDS
pizza_card = RecipeCard.new(jake, pizza_recipe, 5)
sleep(1)
pizza_carda = RecipeCard.new(arslan, pizza_recipe, 4)
sleep(1)
pizza_cardb = RecipeCard.new(picard, pizza_recipe, 3)
sleep(1)
sandwich_card = RecipeCard.new(arslan, sandwich_recipe, 3)
sleep(1)
omelette_card = RecipeCard.new(jake, omelette_recipe, 4)
sleep(1)
soup_card = RecipeCard.new(jake, soup_recipe, 1)

#INGREDIENT
dough = Ingredient.new("dough")
cheese = Ingredient.new("cheese")
sauce = Ingredient.new("sauce")

peanut_butter = Ingredient.new("peanut butter")
bread = Ingredient.new("bread")
jelly = Ingredient.new("jelly")

egg = Ingredient.new("eggs")
broccoli = Ingredient.new("broccoli")
cheese = Ingredient.new("cheese")
pepperoni = Ingredient.new("pepperoni")
anchovies = Ingredient.new("anchovies")

soup = Ingredient.new("Soup")

#ALLERGIES
lactose_int = Allergy.new(arslan, cheese)
lactose_inta = Allergy.new(picard, cheese)
peanuts = Allergy.new(jake, peanut_butter)

#RECIPEINGREDIENT
pizza_dough = RecipeIngredient.new(pizza_recipe, dough)
pizza_sauce = RecipeIngredient.new(pizza_recipe, sauce)
pizza_cheese = RecipeIngredient.new(pizza_recipe, cheese)

sandwich_peanut_butter = RecipeIngredient.new(sandwich_recipe, peanut_butter)
sandwich_bread = RecipeIngredient.new(sandwich_recipe, bread)
sandwich_jelly = RecipeIngredient.new(sandwich_recipe, jelly)

soup_soup = RecipeIngredient.new(soup_recipe, soup)


binding.pry
