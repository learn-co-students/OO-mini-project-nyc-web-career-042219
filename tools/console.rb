require_relative '../config/environment.rb'
require 'date'

kane = User.new("Kane")
christian = User.new("Christian")
cake = Recipe.new("Cake")
chicken=Recipe.new("Chicken")
steak=Recipe.new("Steak")
pie=Recipe.new("Pie")

recipecard1=RecipeCard.new(5,kane,cake)
recipecard2=RecipeCard.new(6,kane,chicken)
recipecard3=RecipeCard.new(7,kane,steak)
recipecard4=RecipeCard.new(1,kane,pie)
cinnamon = Ingredient.new("cinnamon")
chocolate = Ingredient.new("chocolate")
flour=Ingredient.new("flour")
allergykane = Allergy.new(kane,cinnamon)

ingredients_arr = [flour,cinnamon,chocolate]

binding.pry
