class Anime < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_one_attached :image
  
  has_many :reviews
end
