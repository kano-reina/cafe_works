class Review < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
  
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
  
   has_one_attached :image
end
