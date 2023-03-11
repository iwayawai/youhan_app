class Public::RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
    redirect_to recipe_path(@recipe.id)
    else
    render :new
    end 
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @user = @recipe.user
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end 
  
  def index
    if params[:search] == nil
    @recipes = Recipe.page(params[:page])
    elsif params[:search] == ''
    @recipes = Recipe.page(params[:page])
    else
    @recipes = Recipe.where("ingredient LIKE ? or name LIKE ? ",'%' + params[:search] + '%','%' + params[:search] + '%').page(params[:page])
    end 
    
    if params[:star] == 1
      @recipes = Recipe.where(star:'1').page(params[:page])
    elsif params[:star] == 2
      @recipes = Recipe.where(star:'2').page(params[:page])
    elsif params[:star] == 3
      @recipes = Recipe.where(star:'3').page(params[:page])
    else
      @recipes = Recipe.page(params[:page])
    end 
  end 
  
  private
  def recipe_params
    params.require(:recipe).permit(
      :name, 
      :introduction, 
      :star, 
      :genre_id, 
      :time, 
      :price, 
      :ingredient, 
      :procedure, 
      :point, 
      :video, 
      :image)
  end  

end
