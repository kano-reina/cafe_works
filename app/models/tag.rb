class Tag < ApplicationRecord
  has_many :cafe_tags, dependent: :destroy
  has_many :cafes, through: :cafe_tags, dependent: :destroy
end
