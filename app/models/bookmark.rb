class Bookmark < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
  
  validates :user_id, uniqueness: {scope: :cafe_id}
  
end
