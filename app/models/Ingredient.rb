class Ingredient

attr_reader :ingredient

@@all = []


def initialize(ingredient)
  @ingredient = ingredient
  @@all << self
end

end
