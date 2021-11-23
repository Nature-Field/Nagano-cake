class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  #ログイン後のリンク先設定
  def after_sign_in_path_for(resource)
    case resource
      when Customer
        root_path
      when Admin
        admin_path
    end
  end
  #ログアウト後のリンク先設定
  def after_sign_out_path_for(resource)
    if resource_class == Admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    #新規登録時に追加したカラム情報の取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    #カスタマー情報編集時に、追加したカラム情報の取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address])
  end

end
