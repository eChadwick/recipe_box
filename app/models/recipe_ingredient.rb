class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe, validate: true
  belongs_to :ingredient, validate: true

  validates :measurement, presence: { message: 'Ingredient measurement is required.' }
  validates :ingredient, presence: true, null: false
  validates :recipe, presence: true, null: false
end
