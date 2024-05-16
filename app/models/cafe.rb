class Cafe < ApplicationRecord
  self.table_name = 'cafes'
  has_many:posts, dependent: :destroy
  has_many:features, dependent: :destroy
end
