class RecipeCard

attr_reader :date, :rating, :user, :recipe
@@all = []

def initialize(rating,user,recipe)
  @date = Time.now
  @rating = rating
  @user = user
  @recipe = recipe
  @@all << self
end

def self.all
  @@all
end



end
