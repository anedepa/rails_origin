class Article < ApplicationRecord
  
has_many :comments, dependent: :destroy
#validates :user_id, presence: true
validates :contents, presence: true, length: { maximum: 100 }
#validate :check_image

private

    def check_image
   # if !['.jpg', '.png', '.gif'].include?(File.extname(params[:img]).downcase)
if !['.jpg', '.png', '.gif'].include?(img_name.downcase)
        errors.add(:image, "JPG, PNG, GIFのみアップロードできます。")
    elsif file.size > 1.megabyte
        errors.add(:image, "1MBまでアップロードできます")
    end
  end

end
