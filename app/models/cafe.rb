class Cafe < ApplicationRecord
  has_many :cafe_tags, dependent: :destroy
  has_many :tags, through: :cafe_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :has_power_outlet, inclusion: {in: [true, false]}
  validates :chat_meeting_ok, inclusion: {in: [true, false]}
  validates :has_wifi, inclusion: {in: [true, false]}
  
  scope :search_by_name_or_address, ->(query) {
    where('name LIKE ? OR address LIKE ?', "%#{query}%", "%#{query}%")
  }
end
