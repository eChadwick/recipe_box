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
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to recipes_path(@recipe.id)
    else
      populate_flash_errors
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    params[:deleted_ingredients]&.each do |id|
      RecipeIngredient.delete(id)
    end

    @recipe = Recipe.find(params[:id])
    @recipe.attributes = recipe_params

    if @recipe.valid?
      @recipe.save
      redirect_to recipes_path(@recipe.id)
    else
      populate_flash_errors
      render :edit
    end
  end

  private

    # Copies error messages from @recipe to session flash so they can be displayed in a view
    def populate_flash_errors
      flash[:errors] = []
      @recipe.errors.values.each do |error|
        flash[:errors] << error
      end
      flash[:errors].flatten!
    end

    def recipe_params
      params[:recipe][:directions] ||= []
      params.require(:recipe).permit!
    end
end
