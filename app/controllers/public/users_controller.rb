class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
    @recipes = @user.recipes.page(params[:page])
  end 
  
end
