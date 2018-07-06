module RecipesHelper
  def generate_cancel_path
    params[:action] == 'edit' ? recipe_path(params[:id]) : recipes_path
  end
end
