class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe.directions = @recipe.directions
  end

  def delete
    Recipe.destroy(params[:id])
    redirect_to '/recipes'
  end

  def create
    @new_recipe = Recipe.new
  end
end
