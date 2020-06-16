require_relative '../config/environment.rb'

apple_pie = Recipe.new("apple pie")
peach_cobbler = Recipe.new("peach cobbler")
pizza = Recipe.new("pizza")
sandwich = Recipe.new ("sandwich")

jessica = User.new("Jessica")
henry = User.new("Henry")
anna = User.new("Anna")

apples = Ingredient.new("apples")
milk = Ingredient.new("milk")
peaches = Ingredient.new("peaches")
peanuts = Ingredient.new("peanuts")

dairy = Allergy.new(jessica, milk)
nuts = Allergy.new(henry, peanuts)
nuts = Allergy.new(jessica, peanuts)

apple_pie_card = RecipeCard.new("4/29/19", 8, henry, apple_pie)
peach_cobbler_card = RecipeCard.new("4/28/19", 9, jessica, peach_cobbler)
ap_card = RecipeCard.new("4/28/19", 10, anna, peach_cobbler)
pizza_card = RecipeCard.new("1/1/19", 4, jessica, pizza)
sandwich_card = RecipeCard.new("1/2/19", 2, jessica, sandwich)
applepie_card = RecipeCard.new("4/1/19", 8, jessica, apple_pie)

apples_ri = RecipeIngredient.new(apples, apple_pie)
milk_ri = RecipeIngredient.new(milk, apple_pie)
peaches_ri = RecipeIngredient.new(peaches, peach_cobbler)
peanuts_ri = RecipeIngredient.new(peanuts, peach_cobbler)

binding.pry
