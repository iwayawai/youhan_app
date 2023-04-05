class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
    flash[:notice] = "レシピの投稿が成功しました！"
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

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    flash[:notice] = "レシピを編集しました！"
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end

  def index
    @all_recipes = Recipe.all
    if params[:search] == nil
      @recipes = Recipe.page(params[:page]).order('id DESC')
    elsif params[:search] == ''
      @recipes = Recipe.page(params[:page]).order('id DESC')
    else
      genre = Genre.find_by(name: params[:search])
      @recipes = Recipe.where("ingredient LIKE ? or name LIKE ? or genre_id LIKE ?",'%' + params[:search] + '%','%' + params[:search] + '%', genre&.id).page(params[:page]).order('id DESC')
    end

    if params[:star].present?
      if params[:star] == "1"
        @recipes = Recipe.where(star:'1').page(params[:page]).order('id DESC')
      elsif params[:star] == "2"
        @recipes = Recipe.where(star:'2').page(params[:page]).order('id DESC')
      elsif params[:star] == "3"
        @recipes = Recipe.where(star:'3').page(params[:page]).order('id DESC')
      else
        @recipes = Recipe.page(params[:page]).order('id DESC')
      end
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
