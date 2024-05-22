class Cafe < ApplicationRecord
  self.table_name = 'cafes'
  has_many :cafe_tags, dependent: :destroy
  has_many :tags, through: :cafe_tags, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :has_power_outlet, presence: true
  validates :chat_meeting_ok, presence: true
  validates :has_wifi, presence: true
  
  scope :search_by_name_or_address, ->(query) {
    where('name LIKE ? OR address LIKE ?', "%#{query}%", "%#{query}%")
  }
end
