class Allergy

  attr_reader :user, :ingredient
  @@all= []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_allergens
    Allergy.all.collect { |allergy| allergy.ingredient}
  end
end
