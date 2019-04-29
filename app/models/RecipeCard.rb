class RecipeCard
  @@all =[]

  def self.all
    @@all
  end

  attr_reader :recipe, :user, :date, :rating
  def initialize(recipe, user, rating)
    @recipe = recipe
    @user = user
    @date = Time.now
    @rating = rating
    @@all << self
  end
end