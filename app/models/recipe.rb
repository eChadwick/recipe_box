class Recipe < ActiveRecord::Base
  validates :name, presence: { message: 'Recipe name is required' }
  validates :name, uniqueness: { message: 'Recipe name is already in use' }

  validate :ingredients_or_directions_required

  has_many :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients

  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients

  serialize :directions, Array

  def ingredients_or_directions_required
    if recipe_ingredients.blank? && directions.blank?
      errors[:base] << 'Ingredients OR Directions must be included'
    end
  end
end
