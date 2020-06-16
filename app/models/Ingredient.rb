class Ingredient

attr_reader :ingredient

@@all = []


def initialize(ingredient)
  @ingredient = ingredient
  @@all << self
end

def self.most_common_allergen
  arr_ing = Allergy.all.map {|a_obj| a_obj.ingredient}
  freq = arr_ing.inject(Hash.new(0)) {|k,v| k[v] +=1; k}
  arr_ing.max_by{|v| freq[v]}
end

end
