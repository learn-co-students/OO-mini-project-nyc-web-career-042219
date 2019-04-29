require_relative '../config/environment.rb'

a = User.new("alice")
b = User.new("bob")
c = User.new("carol")

d = Recipe.new("doughnut")
e = Recipe.new("eclair")
h = Recipe.new("harissa")
i = Recipe.new("ice cream")

f = Ingredient.new("fish")
g = Ingredient.new("grapes")

alice_doughnut = RecipeCard.new(a, d, 1990, 5)
bob_doughnut = RecipeCard.new(b, d, 1991, 4)
carol_eclair = RecipeCard.new(c, e, 1992, 3)
alice_eclair = RecipeCard.new(a, e, 1993, 2)
alice_harissa = RecipeCard.new(a, h, 1994, 1)
alice_ice_cream = RecipeCard.new(a, i, 1995, 2)

fish_doughnut = RecipeIngredient.new(d, f)
grape_eclair = RecipeIngredient.new(e, g)

alice_fish = Allergy.new(a, f)
alice_grapes = Allergy.new(a, g)
bob_grapes = Allergy.new(b, g)
carol_grapes = Allergy.new(c, g)

binding.pry
