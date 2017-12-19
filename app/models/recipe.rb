class Recipe < ActiveRecord::Base
  validates :name, presence: { message: 'Recipe name is required' }
  validates :name, uniqueness: { message: 'Recipe name is already in use' }

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
