class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page])
  end 
  
  def show
    @user = User.find(params[:id])
  end 
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会処理を実行しました"
    render 'index'
  end 
  
  private
  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :encrypted_password, 
      :is_deleted, 
      :image)
  end
  
end
