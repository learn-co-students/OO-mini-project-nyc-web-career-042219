class Ingredient
  attr_reader :name
  @@all = []

  def initialize (name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    freq = Allergy.all.group_by {|allergy| allergy.ingredient}
    result = freq.sort_by {|k, v| -v.join.length}
    result[0][0]
    binding.pry
    # result = []
    # @@all.each do |ingredient|
    #   Allergy.all.each do |allergy|
    #     binding.pry
    #   end
    # end
  end
end
