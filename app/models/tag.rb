class Tag < ApplicationRecord
  enum has_power_outlet: { available: true, not_available: false }
  enum is_conversation_allowed: { chat_meeting_ok: true, quiet_environment: false }
  enum has_wifi: { available: true, not_available: false }
  has_many :cafe_tags
  has_many :cafes, through: :cafe_tags
end
