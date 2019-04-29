
class Recipe
    @@all = []

    def initialize(type)
        @type = type
        @@all << self
    end

    def self.all
        @@all
    end

    def users
        arr = []
        RecipeCard.all.each do |recipe_card|
            if recipe_card.recipe == self
                arr << recipe_card.user
            end
        end
        arr
    end

    def allergens
        ingredients.select do |ingredient|
            Allergy.allergens_to_ingredients.include?(ingredient)
        end
    end

    def ingredients
        RecipeIngredient.all.select do |ingredients|
            ingredients.recipe == self
        end.map do |ingredients|
            ingredients.ingredient
        end
    end

        def add_ingredients(ingredient_array)
            ingredient_array.each do |ingredient|
                new_ri = RecipeIngredient.new(self, ingredient)
            end
        end


    def self.most_popular
        @@all.each_with_object({}) do |recipe, hash|
            if hash[recipe].nil?
                hash[recipe] = 1
            else
                hash[recipe] += 1
            end
        end.max_by { |recipe, num| num }[0]
    end
end
