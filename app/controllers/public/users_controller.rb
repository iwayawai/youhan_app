class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).order('id DESC')
    @all_recipes = @user.recipes.all
  end 
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.profile_image.attach(params[:user][:profile_image]) if @user.profile_image.blank?
    @user.update(user_params)
    flash[:notice] = "会員情報を更新しました"
    redirect_to user_path(@user)
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorite_recipes = @user.favorite_recipes.page(params[:page]).order('id DESC')
  end 
  
  def comments
    @user = User.find(params[:id])
    @comment_recipes = @user.comment_recipes.page(params[:page]).order('id DESC')
  end 
  
  private
  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :encrypted_password, 
      :is_deleted, 
      :profile_image)
  end
  
end
