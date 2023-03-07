class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page])
    @recipe = Recipe.find(params[:id])
  end 
  
end
