class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def delete
    Recipe.destroy(params[:id])
    redirect_to '/recipes'
  end

  def new
    @new_recipe = Recipe.new
  end

  def create
    @new_recipe = Recipe.create(recipe_params)
    if(params[:recipe_ingredients])
      params[:recipe_ingredients].each do |ri|
        @ingredient = Ingredient.create(name: ri['ingredient'])
        @new_recipe.recipe_ingredients.build(ingredient: @ingredient, measurement: ri['measurement'])
      end
    end
    redirect_to "/recipe/#{@new_recipe.id}" unless !@new_recipe.save
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    # binding.pry
    redirect_to "/recipe/#{params[:id]}"
  end

  private

    def recipe_params
      params.require(:recipe).permit!
    end
end
