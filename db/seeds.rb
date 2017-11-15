require 'open-uri'

User.destroy_all

url = "https://min-api.cryptocompare.com/data/all/coinlist"
data = JSON.parse(open(url).read)
base = "https://www.cryptocompare.com/"

# admin account for easy access
  admin = User.create!(first_name: "admin", email: "admin@admin.com", password: "123123")
  admin_business = Business.create!(user_id: admin.id, name: "admin", address: "admin street", url: "admin.com", email: "admin@admin.com", remote_photo_url: "https://source.unsplash.com/random/400x400")
  Token.create!(name: "admin", business_id: admin_business.id, user_id: admin.id, remote_photo_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAbDAAAAJDMzNzE3YWY3LTc0MWMtNGNjNi04M2QxLTQ2YWE3NDY5NThkZg.jpg")

print "Seeding..."
data["Data"].each_with_index do |(key,value), i|
  # just to keep the seed small
  if i < 5
    # need a user and business for each token
    user = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name,  email: Faker::Internet.email, password: "123123")
    business = Business.create!(user_id: user.id, name: Faker::Company.name, address: Faker::Address.city, url: Faker::Internet.url, email: Faker::Internet.email, remote_photo_url: "https://source.unsplash.com/random/400x400", description: "Businesses that have compelling ethoses end up winning clients even when their prices are not the best in the market or their products or services might not be the most innovative available. Their ethoses may capture the attention of their niches, and their clients develop an emotional attachment.")
    Token.create!(name: value["CoinName"], business_id: business.id, user_id: user.id, remote_photo_url: base + value["ImageUrl"])
    print "."
  end
end

puts "You're all set"

