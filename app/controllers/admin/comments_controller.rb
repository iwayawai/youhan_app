class Admin::CommentsController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    comments = Comment.where(user_id: @user.id).pluck(:recipe_id)
    @comment_recipes = Recipe.find(comments)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_comment_path(:user_id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
