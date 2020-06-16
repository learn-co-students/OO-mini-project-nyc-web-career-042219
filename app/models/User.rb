
require 'date'
class User
  attr_reader :name
  @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @allergies = []
    end

    def self.all
      @@all
    end

    def allergens
      Allergy.all.map {|allergy| allergy.ingredient if allergy.user == self}
    end

    def recipes
      RecipeCard.all.map {|cards|cards.recipe if cards.user == self}
    end

    def add_recipe_card(recipe,rating)
      RecipeCard.new(rating,self,recipe)
    end

    def declare_allergy(ingredient)
      Allergy.new(self,ingredient)
    end

    def top_three_recipes
      rc_user=RecipeCard.all.select{|rc| rc.user == self}

      rc_sortedarray=rc_user.sort {|a, b| a.rating <=> b.rating}.reverse.slice(0,3)
      rc_sortedarray.map{|rc| rc.recipe}
    end

    def most_recent_recipe
      RecipeCard.all.max {|a,b| a.date <=> b.date}
    end
end
