class Review < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
  
  validates :rating, inclusion: { in: 1..5 }
  validates :body, presence: true
  validates :image, presence: true
end
