class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_(resource)
	home_about_path
end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
