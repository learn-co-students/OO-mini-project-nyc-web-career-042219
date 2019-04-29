class Allergy
  attr_accessor :user, :ingredient
  @@all_allergies = []

  def self.all
    @@all_allergies
  end

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all_allergies << self
  end

end
