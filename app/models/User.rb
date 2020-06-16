class User

    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_recipe_card(recipe, date, rating)
            new_rc = RecipeCard.new(self, recipe, rating)
            new_rc.date = date
    end

    def declare_allergy(ingredient)
            Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select do |allergy|
            allergy.user == self
        end.map do |allergy|
            allergy.ingredient
        end
    end

    def recipes_cards_all
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
    end
    def recipes_i
        recipes_cards_all.map do |recipe_card|
            recipe_card.recipe
    end
end

    def top_three_recipes
        recipes_cards_all.sort_by {|recipe| recipe.rating}.reverse.slice(0,3)
    end

    def most_recent_recipe
        RecipeCard.all.last.recipe
    end

    # def safe_recipes
    #     recipes_i.select do |recipe|
    #         Ingredient.non_allergic_ingredient.include?(recipe.ingredients)
    #     end.map { |recipe| recipe }
    # end

    def safe_recipes
        Recipe.all.select do |recipe|
            (recipe.ingredients & self.allergens).length == 0
        end
    end
end
