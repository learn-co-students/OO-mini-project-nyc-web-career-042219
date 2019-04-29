require_relative '../config/environment.rb'

pamyk  = User.new("Pamyk")
carly = User.new("Carly")



cake = Recipe.new("cake")
ice_cream = Recipe.new("ice_cream")
chocolate = Recipe.new("chocolate")
bread = Recipe.new("bread")




peanuts = Ingredient.new("peanut")
flour = Ingredient.new("flour")
sugar = Ingredient.new("sugar")

pamyk_allergy = Allergy.new(pamyk, flour)
carly_allergy = Allergy.new(carly, peanuts)
pamyk_second_allergy = Allergy.new(pamyk, peanuts)

ice_cream_card = RecipeCard.new(pamyk, ice_cream, 4)
ice_cream_carly = RecipeCard.new(carly, ice_cream, 5)
cake_card = RecipeCard.new(carly, cake, 3)
pamyk_cake = RecipeCard.new(pamyk, cake, 5)
pamyk_sugar = RecipeCard.new(pamyk, bread, 5)


flour_cake = RecipeIngredient.new(cake, flour)
ice_cream_cake = RecipeIngredient.new(ice_cream, flour)
ice_cream4 = RecipeIngredient.new(ice_cream, peanuts)
bread_sugar = RecipeIngredient.new(bread, sugar)



binding.pry
