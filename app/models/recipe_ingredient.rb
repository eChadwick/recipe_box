class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe, validate: true
  belongs_to :ingredient, validate: true

  accepts_nested_attributes_for :ingredient
end
