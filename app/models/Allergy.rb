class Allergy

    @@all = []

    attr_reader :user, :ingredient

    def initialize(user, ingredient)
        @user = user
        @ingredient= ingredient
        @@all << self
    end
    def self.allergens_to_ingredients
        self.all.collect { |allergies| allergies.ingredient}
    end

    def self.all
        @@all
    end
end
