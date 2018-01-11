# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.create(name: 'Ice Water', directions: ['Place water in glass.', 'Add ice to water', 'Stir if desired'])
Recipe.create(name: 'Buttered Toast', directions: ['Make toast according to directions on toaster','Spread butter on toast'])

Ingredient.create([{name: 'Water'}, {name: 'Toast'}, {name: 'Ice'}, {name: 'Butter'}])

RecipeIngredient.create([{recipe_id: 1, ingredient_id: 1, measurement: 'One glass'}, {recipe_id: 1, ingredient_id: 3,
  measurement: 'Several Cubes'}])
RecipeIngredient.create([{recipe_id: 2, ingredient_id: 2, measurement: 'A few pieces'}, {recipe_id: 2, ingredient_id: 4,
  measurement: '2 Tbs'}])

