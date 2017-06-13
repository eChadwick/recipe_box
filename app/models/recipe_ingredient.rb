class RecipeIngredient < ActiveRecord::Base
  validates :measurement, presence: { message: 'Ingredient measurement is required.' }
  validates :ingredient, presence: true, null: false
  validates :recipe, presence: true, null: false

  belongs_to :recipe, validate: true
  belongs_to :ingredient, validate: true
end
