class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login_name, account_attributes: %i[name birth_date icon mail address tel allergy]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login_name, account_attributes: %i[name birth_date icon mail address tel allergy]])
  end
end
