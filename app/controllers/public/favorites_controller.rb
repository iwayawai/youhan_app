class Public::FavoritesController < ApplicationController
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: recipe.id)
    favorite.save
    redirect_to recipe_path(recipe.id)
  end
  
  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    redirect_to recipe_path(recipe.id)
  end
  
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @user = @recipe.user
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @favorite_recipes = Recipe.find(favorites)
  end
  
end
