class Post < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
  
  has_one_attached :image
 
end
