class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def save
    self.name = self.name.capitalize
    super unless Ingredient.find_by(name: self.name)
  end

end
