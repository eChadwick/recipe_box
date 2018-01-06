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

  def new
    @new_recipe = Recipe.new
  end

  def create
    require 'pry'
    binding.pry
    @new_recipe = Recipe.new(recipe_params)
    @new_recipe.save
  end

  private

    def recipe_params
      params.require(:recipe).permit!
    end
end
