class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page])
  end 
  
  def show
    @user = User.find(params[:id])
  end 
  
  def destroy
    @users = User.page(params[:page])
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    render :index
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
  
  def authenticate_admin!
    unless current_user.admin?
      redirect_to new_admin_session_path, alert: "アクセス権限がありません。"
    end
  end
  
  
end
