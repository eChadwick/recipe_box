class DropUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :ingredients, :recipe_ingredient_id
    remove_column :recipes, :recipe_ingredient_id
    rename_column :recipes, :origin, :source
  end
end
