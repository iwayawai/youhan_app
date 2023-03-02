class Public::RecipesController < ApplicationController
  
  def new
    @recipe=Recipe.new
    @genres=Genre.all
  end
  
  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.save
    redirect_to recipe_path(@recipe.id)
  end 
  
  private
  def recipe_params
    params.require(:recipe).permit(:name, :introduction, :star, :genre_id, :time, :price, :ingredient_id, :procedure, :point, :video, :image)
  end  

end
