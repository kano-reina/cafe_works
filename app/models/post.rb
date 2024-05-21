class Post < ApplicationRecord
  belongs_to :cafe
  belongs_to :user
end
