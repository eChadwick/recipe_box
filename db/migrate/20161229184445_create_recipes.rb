class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :directions
      t.string :origin
      t.references :recipe_ingredient

      t.timestamps null: false
    end
  end
end
