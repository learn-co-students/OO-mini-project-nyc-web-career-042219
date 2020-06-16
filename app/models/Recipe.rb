require 'pry'

class Recipe

    @@all = []

    attr_accessor :name

    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
      @@all
    end

    def self.most_popular
      cards = RecipeCard.all.map{ |card| card.recipe }
      counts = Hash.new(0)
      cards.each { |u| counts[u] += 1 }
      counts.max_by { |u, count| count }[0]
    end

    def users
      cards = RecipeCard.all.map do |card|
        card.recipe == self
      end
      cards.map { |card| card.user }
    end

    def ingredients # gets array of ingredients in this recipe
      recipes = RecipeIngredient.all.select{ |ri| ri.recipe == self }
      recipes.map { |recipe| recipe.ingredient}
    end

# self's ingredients that are users' allergens
# take self's ingredients
# take users' allergens
# output common elements, which are ingredients
    def allergens
      ingredients
      x = User.all.map { |user| user.allergens }.flatten
      y = x.map { |allergy| allergy.ingredient }
      ingredients & y
    end

    def add_ingredients(ingredients) #arr of ingredients
      RecipeIngredient.new(ingredients, self)
    end

end
