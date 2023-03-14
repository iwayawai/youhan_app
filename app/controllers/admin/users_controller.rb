class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page])
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
