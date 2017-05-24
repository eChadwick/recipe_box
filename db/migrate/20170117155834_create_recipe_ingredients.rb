class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false
      t.references :ingredient, null: false
      t.string :measurement, null: false

      t.timestamps null: false
    end
    add_foreign_key :recipe_ingredients, :recipes
    add_foreign_key :recipe_ingredients, :ingredients
  end
end
