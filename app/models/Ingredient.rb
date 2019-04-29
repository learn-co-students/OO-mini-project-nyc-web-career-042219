require 'pry'
class Ingredient

    @@all = []

    attr_reader :name
    def initialize(name)
        @name =name
        @@all << self
    end

    def self.all
        @@all
    end


    def self.most_common_allergen
        Allergy.all.each_with_object({}) do |allergy, hash|
            if hash[allergy.ingredient].nil?
                hash[allergy.ingredient] = 1
            else
                hash[allergy.ingredient] += 1
            end
        end.max_by { |key, num| num }[0]
    end
end

# def self.most_common_allergen
#     # itirating all
#
#     my_allergy= Allergy.all.select do |allergy|
#         allergy.ingredient == self
#     end
#     binding.pry
#     my_allergy.max_by {|allergy| ingredient.allergy}
#
# end
# end
