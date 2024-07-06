# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

user2 = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

user3 = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
end

user4 = User.find_or_create_by!(email: "mary@example.com") do |user|
  user.name = "Mary"
  user.password = "password"
end

cafe1 = Cafe.find_or_create_by!(name: 'almond hostel & cafe') do |cafe|
  cafe.address = '東京都渋谷区元代々木町１'
  cafe.has_power_outlet = false
  cafe.chat_meeting_ok = true
  cafe.has_wifi = true
  cafe.opening_hours = 
  '08:00 - 24:00
  
  DRINK & SWEETS
  08:00 - 23:30
  
  FOOD
  11:30 - 21:00'
  cafe.introduction = 'ホステルに併設されたカフェです。'
end

cafe2 = Cafe.find_or_create_by!(name: 'Blue Bottle Coffee') do |cafe|
  cafe.address = '300 S Broadway, Los Angeles, CA 90013'
  cafe.has_power_outlet = false
  cafe.chat_meeting_ok = true
  cafe.has_wifi = true
  cafe.opening_hours = 
  'Mon-Fri 7:00am-5:30pm
  Sat-Sun 7:00am-6:00pm'
  cafe.introduction = 'It is a Blue Bottle Coffee chain in downtown LA. 
  An open space creates a comfortable atmosphere that allows you to focus on your own work.'
end

cafe3 = Cafe.find_or_create_by!(name: 'Brooklyn Roasting Company Kitahama') do |cafe|
  cafe.address = '大阪府大阪市中央区北浜１丁目１−９'
  cafe.has_power_outlet = true
  cafe.chat_meeting_ok = true
  cafe.has_wifi = true
  cafe.opening_hours = 
  'Mon-Fri 8:00am-7:00pm
  Sat-Sun 8:00am-8:00pm'
  cafe.introduction = '北浜の川沿いにあるコーヒーショップです。店内はそこまで広くないですが、wifiや電源席があり、良い景色のもとで快適に作業を行うことができます。'
end

cafe4 = Cafe.find_or_create_by!(name: 'Brown Sound Coffee') do |cafe|
  cafe.address = '千葉県習志野市津田沼２丁目８−１１'
  cafe.has_power_outlet = false
  cafe.chat_meeting_ok = false
  cafe.has_wifi = false
  cafe.opening_hours = 
  'OPEN_11:00 - 17:00 (L.O. 16:50)
  CLOSED_MONDAY, THURSDAY'
  cafe.introduction = 'コーヒーに非常にこだわったカフェ。落ち着いた雰囲気。
  サイトURL: http://brownsoundcoffee.com/'
end

cafe5 = Cafe.find_or_create_by!(name: 'ARCHIVE COFFEE ROASTERS') do |cafe|
  cafe.address = '広島県広島市中区本川町２−１−１２'
  cafe.has_power_outlet = true
  cafe.chat_meeting_ok = true
  cafe.has_wifi = false
  cafe.opening_hours = 
  '8:00am-6:00pm'
  cafe.introduction = '原爆ドームから川を渡ってすぐの落ち着いた一角にあるカフェ。席は少ないが、空間は広めで落ち着いて作業ができる。'
end

cafe6 = Cafe.find_or_create_by!(name: 'Single O Hamacho') do |cafe|
  cafe.address = '東京都中央区日本橋浜町３丁目１６−７'
  cafe.has_power_outlet = false
  cafe.chat_meeting_ok = true
  cafe.has_wifi = false
  cafe.opening_hours = 
  'Mon-Fri 7:30am-7:00pm
  Sat-Sun 8:00am-7:00pm'
  cafe.introduction = 'さまざまな種類のコーヒーが揃う解放的な雰囲気のカフェ。'
end

cafe7 = Cafe.find_or_create_by!(name: 'iki Roastery & Eatery') do |cafe|
  cafe.address = '東京都江東区清澄１−４−７'
  cafe.has_power_outlet = false
  cafe.chat_meeting_ok = true
  cafe.has_wifi = false
  cafe.opening_hours = 
  'Mon-Fri 8:00am-5:00pm
  Sat-Sun 8:00am-6:00pm'
  cafe.introduction = '隅田川沿いにあるカフェ。近くにあるiki ESPRESSOの系列店。パンや軽食、コーヒーを楽しめる。'
end

tag1 = Tag.find_or_create_by!(name: 'Hotel')
tag2 = Tag.find_or_create_by!(name: 'Stylish')
tag3 = Tag.find_or_create_by!(name: 'LA')

CafeTag.find_or_create_by!(cafe: cafe1, tag: tag1)
CafeTag.find_or_create_by!(cafe: cafe1, tag: tag2)
CafeTag.find_or_create_by!(cafe: cafe2, tag: tag2)
CafeTag.find_or_create_by!(cafe: cafe2, tag: tag3)


Bookmark.find_or_create_by!(user: user1, cafe: cafe1)

review1 = Review.find_or_create_by!(user: user1, cafe: cafe1) do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  review.body = 'とてもおしゃれな雰囲気です。'
  review.rating = 5
end

review2 = Review.find_or_create_by!(user: user1, cafe: cafe2) do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  review.body = '作業がしやすい環境でとてもおすすめです。'
  review.rating = 5
end

review3 = Review.find_or_create_by!(user: user3, cafe: cafe2) do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  review.body = 'Very easy to focus. Wish the line is shorter!'
  review.rating = 4
end

review4 = Review.find_or_create_by!(user: user2, cafe: cafe4) do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  review.body = 'テーブルが大きくて作業しやすいです。'
  review.rating = 4
end

review5 = Review.find_or_create_by!(user: user4, cafe: cafe6) do |review|
  review.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  review.body = '店内はとても小さいですが、スタッフさんがとてもフレンドリーでコーヒーもおいしいのでお気に入りです。一人で作業している人が多い印象です。'
  review.rating = 5
end

Comment.find_or_create_by!(user: user2, review: review1) do |comment|
  comment.comment = '素敵ですね！'
end