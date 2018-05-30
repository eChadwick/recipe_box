class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to recipes_path
  end

  def new
    @new_recipe = Recipe.new
  end

  def create
    @new_recipe = Recipe.create(recipe_params)
    redirect_to recipes_path(@new_recipe.id) unless !@new_recipe.save
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    Recipe.update(params[:id], recipe_params)
    redirect_to recipes_path(params[:id]), method: :get
  end

  private

    def recipe_params
      params.require(:recipe).permit!
    end
end
