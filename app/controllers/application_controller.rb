class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

before_action :authenticate_user!, except: [:top,:index,:show,:about]
before_action :authenticate_admin!, if: :admin_url 

def admin_url
  request.fullpath.include?("/admin")
end

def after_sign_in_path_for(resource)
  case resource
  when Admin
      admin_root_path
  when User
      user_path(current_user.id)
  end
end

def after_sign_out_path_for(resource)
  case resource
  when :admin
       admin_session_path
  when :user
       root_path
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end