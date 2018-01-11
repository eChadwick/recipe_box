class Recipe < ActiveRecord::Base
  validates :name, presence: { message: 'Recipe name is required' }
  validates :name, uniqueness: { message: 'Recipe name is already in use' }

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  serialize :directions, Array

  accepts_nested_attributes_for :recipe_ingredients
  accepts_nested_attributes_for :ingredients
end
