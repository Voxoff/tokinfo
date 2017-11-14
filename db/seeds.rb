require 'open-uri'

url = "https://api.coinmarketcap.com/v1/ticker/"
data = JSON.parse(open(url).read)

# admin account for easy access
  admin = User.create!(first_name: "admin", email: "admin@admin.com", password: "123123")
  admin_business = Business.create!(user_id: admin.id, name: "admin", address: "admin street", url: "admin.com", email: "admin@admin.com")
  Token.create!(name: "admin", business_id: admin_business.id, user_id: admin.id)

print "Seeding..."
data.each_with_index do |coin, i|
  # just to keep the seed small
  if i < 10
    # need a user and business for each token
    user = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name,  email: Faker::Internet.email, password: "123123")
    business = Business.create!(user_id: user.id, name: Faker::Company.name, address: Faker::Address.city, url: Faker::Internet.url, email: Faker::Internet.email)
    Token.create!(name: coin["name"], business_id: business.id, user_id: user.id)
    print "."
  end
end

puts "You're all set"

