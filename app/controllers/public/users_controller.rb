class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page])
    @recipe = Recipe.find(params[:id])
  end 
  
  def edit
    @user = current_user
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice]= "退会処理を実行いたしました"
    redirect_to root_path
  end 
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :is_deleted, :image)
  end
  
end
