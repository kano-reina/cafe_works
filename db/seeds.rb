# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

cafe1 = Cafe.find_or_create_by!(name: 'almond hostel & cafe') do |cafe|
  cafe.address = '東京都渋谷区元代々木町１'
  cafe.has_power_outlet = false
  cafe.chat_meeting_ok = true
  cafe.has_wifi = true
  cafe.opening_hours = '08:00 - 24:00\n\nDRINK & SWEETS\n08:00 - 23:30\n\nFOOD\n11:30 - 21:00'
  cafe.introduction = 'ホステルに併設されたカフェです。'
end

tag1 = Tag.find_or_create_by!(name: 'Hotel')
tag2 = Tag.find_or_create_by!(name: 'Stylish')

CafeTag.find_or_create_by!(cafe: cafe1, tag: tag1)
CafeTag.find_or_create_by!(cafe: cafe1, tag: tag2)

Bookmark.find_or_create_by!(user: user1, cafe: cafe1)

review1 = Review.find_or_create_by!(user: user1, cafe: cafe1) do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  review.body = 'とてもおしゃれな雰囲気です。'
  review.rating = 5
end

Comment.find_or_create_by!(user: user2, review: review1) do |comment|
  comment.comment = '素敵ですね！'
end