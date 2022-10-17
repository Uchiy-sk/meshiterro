class ApplicationController < ActionController::Base

  # ログイン認証の権限
  before_action :authenticate_user!, except: [:top] #ログインしてなければログイン画面にリダイレクト

  # devise機能の前にメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先メソッド（デフォルト:rootパス）
  def after_sign_in_path_for(resource)
    post_images_path
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
