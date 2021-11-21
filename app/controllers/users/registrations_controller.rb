# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.login_name.downcase == "ゲスト" || resource.login_name.downcase == "ゲスト管理者"
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end

  # GET /resource/sign_up
  def new
    build_resource({})
    resource.build_account
    respond_with resource
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
    build_resource({})
    resource.build_account
    @user.account.icon.cache! unless @user.account.icon.blank?
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up) { |user| user.permit(permitted_attributes) }
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes)
  end

  def permitted_attributes
    [
      :login_name,
      :password,
      :password_confirmation,
      profile_attributes: %i[name birth_date icon icon_cache mail address tel allergy id]
    ]
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: permitted_attributes)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    mypage_path(resource)
  end

  def after_update_path_for(resource)
    user_path(current_user.id)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    mypage_path(resource)
  end
end
