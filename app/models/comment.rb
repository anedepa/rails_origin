class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: { maximum: 30 }
end
