require 'pry'
class RecipeCard

    @@all = []
     attr_reader :user, :recipe, :rating
     attr_accessor :date

    def initialize(user, recipe, rating)
        @user = user
        @recipe = recipe
        @rating = rating
        @@all << self
    end

    def recipe
        # binding.pry
        @recipe
    end

    def self.all
        @@all
    end

end
