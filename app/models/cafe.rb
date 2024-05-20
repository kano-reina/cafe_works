class Cafe < ApplicationRecord
  self.table_name = 'cafes'
  has_many :cafe_tags
  has_many :tags, through: :cafe_tags
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true, uniqueness: { case_sensitive: false }
  validates :city, presence: true
  validates :has_power_outlet, presence: true
  validates :chat_meeting_ok, presence: true
  validates :has_wifi, presence: true
  
  def self.search_by_tags(tag_ids)
    joins(:cafe_tags).where(cafe_tags: { tag_id: tag_ids }).distinct
  end
end
