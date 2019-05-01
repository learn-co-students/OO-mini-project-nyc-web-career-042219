require_relative '../config/environment.rb'

ob = User.new("Bob")
amy = User.new("Amy")
jim = User.new("Jim")

pancakes = Recipe.new("Pancakes")
cookies = Recipe.new("Cookies")
pie = Recipe.new("Pie")
ice_cream = Recipe.new("Ice Cream")
cream_spinach = Recipe.new("Cream Spinach")

bob.add_recipe_card(pancakes, 42919, 10)
bob.add_recipe_card(cookies, 42819, 7)
bob.add_recipe_card(pie, 42719, 9)
bob.add_recipe_card(ice_cream, 50119, 8)

amy.add_recipe_card(pancakes, 42919, 10)
amy.add_recipe_card(cream_spinach, 50119, 7)

jim.add_recipe_card(ice_cream, 50119, 8)
jim.add_recipe_card(pancakes, 42919, 10)

flour = Ingredient.new("Flour")
eggs = Ingredient.new("eggs")
butter = Ingredient.new("butter")
milk = Ingredient.new("Milk")
sugar = Ingredient.new("Sugar")
choco_chips = Ingredient.new("Chocolate Chips")
blueberries = Ingredient.new("Blueberries")
spinach = Ingredient.new("Spinach")

pancakes_arr = [flour, eggs, butter]
ice_cream_arr = [milk, sugar]
cookies_arr = [flour, eggs, butter, sugar, choco_chips]
pie_arr = [flour, eggs, butter, blueberries]
cream_spinach_arr = [spinach, butter, milk]

bob.declare_allergy(flour)
amy.declare_allergy(flour)
jim.declare_allergy(butter)

pancakes.add_ingredients(pancakes_arr)
ice_cream.add_ingredients(ice_cream_arr)
cookies.add_ingredients(cookies_arr)
pie.add_ingredients(pie_arr)
cream_spinach.add_ingredients(cream_spinach_arr)

binding.pry
