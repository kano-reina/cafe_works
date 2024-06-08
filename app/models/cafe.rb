class Cafe < ApplicationRecord
  has_many :cafe_tags, dependent: :destroy
  has_many :tags, through: :cafe_tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :has_power_outlet, inclusion: {in: [true, false]}
  validates :chat_meeting_ok, inclusion: {in: [true, false]}
  validates :has_wifi, inclusion: {in: [true, false]}
  
  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(2)
  end
  
  scope :search_by_name_or_address, ->(query) {
    where('name LIKE ? OR address LIKE ?', "%#{query}%", "%#{query}%")
  }
  
  scope :filter_by_category, ->(category) {
    case category
    when 'has_power_outlet'
      where(has_power_outlet: true)
    when 'chat_meeting_ok'
      where(chat_meeting_ok: true)
    when 'quiet_environment'
      where(chat_meeting_ok: false)
    when 'has_wifi'
      where(has_wifi: true)
    else
      all
    end
  }
  
end