class Cafe < ApplicationRecord
  self.table_name = 'cafes'
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  
  def self.search_by_tags(tag_ids)
    joins(:cafe_tags).where(cafe_tags: { tag_id: tag_ids }).distinct
  end
end
