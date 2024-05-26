class Review < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
  
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
  
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image2.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end 
end
