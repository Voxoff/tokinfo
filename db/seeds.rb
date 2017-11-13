# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'
require 'open-uri'
require 'faker'

url = "https://api.coinmarketcap.com/v1/ticker/"

data = JSON.parse(open(url).read)
# binding.pry
# We have to create a user for each business for eahc coin
# , just assigning names as numbers right now
data.each do |coin|
  user = User.create!(first_name: Faker::Name.name, email: Faker::Internet.email, password: "123123")
  business = Business.create!(user_id: user.id, name: Faker::Company.name, address: Faker::Address.city, url: Faker::Internet.url, email: Faker::Internet.email)
  Token.create!(name: coin["name"], business_id: business.id)
  puts "working?"
  puts user
  puts business
end


# bus = Business.create(user_id: 1, name: "Guy's Business", address: "10 Downing Street", user)
# Token.create(name:"Guy's $$$", businesses_id: bus.id)


