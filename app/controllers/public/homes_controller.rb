class Public::HomesController < ApplicationController
  
  def top
    @user = current_user
    @recipes = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end
  
  def about
    @user = current_user
  end 

end
