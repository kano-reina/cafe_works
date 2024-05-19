class Cafe < ApplicationRecord
  self.table_name = 'cafes'
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags  
end
