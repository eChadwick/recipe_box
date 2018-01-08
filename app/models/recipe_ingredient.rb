class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe, validate: true
  belongs_to :ingredient, validate: true
end
