class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, # パスワードの正確性を検証
         :registerable,             # ユーザ登録や編集、リセット
         :recoverable,              # パスワードをリセット
         :rememberable,             # ログイン情報を保存
         :validatable               # emailのフォーマットなどのバリデーション

  # アソシエーション設定（user_idの関連付け）
  has_many :post_images, dependent: :destroy
end
