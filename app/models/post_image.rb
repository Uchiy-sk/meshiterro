class PostImage < ApplicationRecord

  # Active Storage
  has_one_attached :image

  # Userモデル関連付け
  belongs_to :user
  
  # PostCommentモデルと関連付け
  has_many :post_comments, dependent: :destroy

  # 画像表示関数の定義
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assers/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
