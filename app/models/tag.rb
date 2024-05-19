class Tag < ApplicationRecord
  has_many :cafe_tags
  has_many :cafes, through: :cafe_tags
end
