class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    mypage_path(resource)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i 
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login_name, :password, :password_confirmation,account_attributes: %i[name birth_date icon mail address tel allergy icon_cache id]])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login_name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login_name, :password, :password_confirmation,account_attributes: %i[name birth_date icon mail address tel allergy icon_cache id]])
  end
end
