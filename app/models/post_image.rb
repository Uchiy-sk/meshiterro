class PostImage < ApplicationRecord

  # Active Storage
  has_one_attached :image

  # Userモデル関連付け
  belongs_to :user

end
