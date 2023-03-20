class Admin::CommentsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    comments = Comment.where(user_id: @user.id).pluck(:recipe_id)
    @comment_recipes = Recipe.find(comments)
    @comments = Comment.page(params[:page])
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_user_comments_path(params[:user_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end