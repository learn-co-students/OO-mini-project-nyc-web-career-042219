class RecipeCard
  attr_accessor :user, :recipe, :date, :rating
  @@all_cards = []

  def self.all
    @@all_cards
  end

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating.to_i
    @@all_cards << self
  end

end
