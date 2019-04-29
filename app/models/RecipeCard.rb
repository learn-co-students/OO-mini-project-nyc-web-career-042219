class RecipeCard

  attr_reader :date, :user, :recipe, :rating
  @@all = []

  def initialize(user, recipe, rating, date)
    @date = date
    @user = user
    @recipe = recipe
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
