class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe, validate: true
  belongs_to :ingredient, validate: true

  accepts_nested_attributes_for :ingredient, reject_if: :ingredient_exists?

  protected

    def ingredient_exists?(ingredient_attrs)
      ingredient_attrs[:name].capitalize!
      if ingredient = Ingredient.find_by(name: ingredient_attrs[:name])
        self.ingredient = ingredient
        return true
      else
        return false
      end
    end
end
