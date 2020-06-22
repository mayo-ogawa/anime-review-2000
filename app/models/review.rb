class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  
  validates :content, presence: true, length: { maximum: 255 }
end
