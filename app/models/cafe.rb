class Cafe < ApplicationRecord
  has many:posts, dependent: :destroy
end
