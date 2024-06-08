class Tag < ApplicationRecord
  has_many :cafe_tags, dependent: :destroy
  has_many :cafes, through: :cafe_tags, dependent: :destroy
  
  def self.top_tags(limit = 3)
    Tag.left_joins(:cafe_tags)
       .group(:id)
       .order(Arel.sql('COUNT(cafe_tags.tag_id) DESC'))
       .limit(limit)
  end
end
