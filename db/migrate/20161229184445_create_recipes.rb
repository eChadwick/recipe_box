class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :directions, null: false
      t.string :origin

      t.timestamps null: false
    end
  end
end
