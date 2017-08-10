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
end
