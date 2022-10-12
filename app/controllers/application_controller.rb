class ApplicationController < ActionController::Base
  # devise機能の前にメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先メソッド（デフォルト:rootパス）
  def after_sign_in_path_for(resource)
    about_path
  end

  # サインアウト後の遷移先メソッド（デフォルト:rootパス）
  def after_sign_out_path_for(resource)
    about_path
  end

  # 他のcontrollerからも参照可（ストロングパラメータ）
  protected

  def configure_permitted_parameters
    # ユーザ名(name)のデータ操作許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
