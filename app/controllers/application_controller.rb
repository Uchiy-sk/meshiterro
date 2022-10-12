class ApplicationController < ActionController::Base
  # devise機能の前にメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 他のcontrollerからも参照可（ストロングパラメータ）
  protected

  def configure_permitted_parameters
    # ユーザ名(name)のデータ操作許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
