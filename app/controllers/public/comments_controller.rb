class Public::CommentsController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @user = @recipe.user
    comments = Comment.where(user_id: @user.id).pluck(:recipe_id)
    @comment_recipes = Recipe.find(comments)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
