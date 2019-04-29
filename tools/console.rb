require_relative '../config/environment.rb'

bob = User.new("Bob")
amy = User.new("Amy")
jim = User.new("Jim")

pancakes = Recipe.new("Pancakes")
cookies = Recipe.new("Cookies")
pie = Recipe.new("Pie")
ice_cream = Recipe.new("Ice Cream")

bob.add_recipe_card(pancakes, 42919, 10)
bob.add_recipe_card(cookies, 42819, 7)
bob.add_recipe_card(pie, 42719, 9)
bob.add_recipe_card(ice_cream, 50119, 8)

amy.add_recipe_card(pancakes, 42919, 10)

jim.add_recipe_card(ice_cream, 50119, 8)
jim.add_recipe_card(pancakes, 42919, 10)


flour = Ingredient.new("Flour")
eggs = Ingredient.new("eggs")
butter = Ingredient.new("butter")

ingredients_test = [flour, eggs, butter]

bob.declare_allergy(flour)
amy.declare_allergy(flour)
jim.declare_allergy(butter)

pancakes.add_ingredients(ingredients_test)


binding.pry
