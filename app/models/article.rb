class Article < ApplicationRecord
 belongs_to :user 
 has_many :comments, dependent: :destroy

 mount_uploader :picture, PictureUploader
 validates :user_id, presence: true
 validates :title, presence: true
 validates :contents, presence: true, length: { maximum: 100 }
 validate  :picture_size

  private
   
    def picture_size
      if picture.size > 3.megabytes
        errors.add(:picture, "should be less than 3MB")
      end
    end

end
