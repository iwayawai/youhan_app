class Public::CommentsController < ApplicationController
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe.id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end 
end
