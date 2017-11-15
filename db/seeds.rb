require 'open-uri'

User.destroy_all

url = "https://min-api.cryptocompare.com/data/all/coinlist"
data = JSON.parse(open(url).read)
base = "https://www.cryptocompare.com/"
fnames = ["Alex", "Jamie", "Leonard", "Guy", "Edward"]
snames = ["Haumer", "Dujadin", "Percival", "Bennett-Jones", "Wardward"]
businesses = ["Ethereum Foundation", "Ripple Co.", "Facebook", "Google", "Coinbase"]
business_photos = ["https://consensys.net/img/ventures/logos/ethlogo.jpg", "https://cointelegraph.com/storage/uploads/view/e64927f38e4a4786543e71b6120963f7.jpg", "https://facebookbrand.com/wp-content/themes/fb-branding/prj-fb-branding/assets/images/fb-art.png", "https://pbs.twimg.com/profile_images/839721704163155970/LI_TRk1z.jpg", "http://bitcoinist.com/wp-content/uploads/2015/12/Coinbase-Logo-300x246.png"]

# admin account for easy access
  admin = User.create!(first_name: "Alex", last_name: "Benoit", email: "alex@benoit.com", password: "123123", remote_photo_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAbDAAAAJDMzNzE3YWY3LTc0MWMtNGNjNi04M2QxLTQ2YWE3NDY5NThkZg.jpg")
  admin_business = Business.create!(user_id: admin.id, name: "Le Wagon", address: "admin street", url: "admin.com", email: "admin@admin.com", remote_photo_url: "http://lewagon.github.io/ui-components/images/lewagon.png")
  admin_token = Token.create!(name: "WagonCoin", business_id: admin_business.id, user_id: admin.id, remote_photo_url: "http://lewagon.github.io/ui-components/images/lewagon.png")

print "Seeding..."
data["Data"].each_with_index do |(key,value), i|
  # just to keep the seed small
  if i < 5
    # need a user and business for each token
    user = User.create!(first_name: fnames[i], last_name: snames[i],  email: snames[i] + "@hotmail.com", password: "123123", remote_photo_url: "https://source.unsplash.com/random/400x400&sig=#{i}&smile")
    business = Business.create!(user_id: user.id, name: businesses[i], address: Faker::Address.city, url: Faker::Internet.url, email: Faker::Internet.email, remote_photo_url: business_photos[i], description: "Businesses that have compelling ethoses end up winning clients even when their prices are not the best in the market or their products or services might not be the most innovative available. Their ethoses may capture the attention of their niches, and their clients develop an emotional attachment.")
    Token.create!(name: value["CoinName"], business_id: business.id, user_id: user.id, remote_photo_url: base + value["ImageUrl"])
    Following.create!(user: user, token: admin_token)
    print "."
  end
end

puts "You're all set"

