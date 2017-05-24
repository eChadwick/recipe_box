class Ingredient < ActiveRecord::Base
  validates :name, presence: { message: 'Ingredient name is required' }
  validates :name, uniqueness: { message: 'Ingredient with that name already exists' }
  has_many :recipe_ingredients
end
