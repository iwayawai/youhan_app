class Public::RecipesController < ApplicationController
  
  def new
    @recipe=Recipe.new
  end
  
  def create
    @recipe=Recipe.new(recipe_params)
    if @recipe.save
    redirect_to recipe_path(@recipe.id)
    else
    render :new
    end 
  end
  
  def show
    @recipe=Recipe.find(params[:id])
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:name, :introduction, :star, :genre_id, :time, :price, :ingredient, :procedure, :point, :video, :image)
  end  

end
