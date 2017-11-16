# require 'open-uri'

# User.destroy_all

# url = "https://min-api.cryptocompare.com/data/all/coinlist"
# data = JSON.parse(open(url).read)
# base = "https://www.cryptocompare.com/"
# fnames = ["Alex", "Jamie", "Leonard", "Guy", "Edward"]
# snames = ["Haumer", "Dujardin", "Percival", "Bennett-Jones", "Wardward"]
# businesses = ["Ethereum Foundation", "Ripple Co.", "Facebook", "Google", "Coinbase"]
# uphotos = ["https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/22352358_1979202722367603_4743582015956189184_n.jpg", "https://i.pinimg.com/avatars/jamiedujardin_1411542889_280.jpg", "https://i.ytimg.com/vi/JBUGYHcQOAw/maxresdefault.jpg", "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAA1pAAAAJGQyNmI2ZmVlLTg2NTItNGU0NC1iZWFmLTg2NDc4NDY4ZDFiMg.jpg", "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/1/005/051/0ee/3e8e637.jpg"]
# business_photos = ["https://consensys.net/img/ventures/logos/ethlogo.jpg", "https://cointelegraph.com/storage/uploads/view/e64927f38e4a4786543e71b6120963f7.jpg", "https://facebookbrand.com/wp-content/themes/fb-branding/prj-fb-branding/assets/images/fb-art.png", "https://pbs.twimg.com/profile_images/839721704163155970/LI_TRk1z.jpg", "http://bitcoinist.com/wp-content/uploads/2015/12/Coinbase-Logo-300x246.png"]

# # admin account for easy access
#   admin = User.create!(first_name: "Alex", last_name: "Benoit", email: "alex@benoit.com", password: "123123", remote_photo_url: "https://avatars3.githubusercontent.com/u/16181471?v=4")
#   admin_business = Business.create!(user_id: admin.id, name: "Le Wagon", address: "admin street", url: "admin.com", email: "admin@admin.com", remote_photo_url: "http://lewagon.github.io/ui-components/images/lewagon.png")
#   admin_token = Token.create!(name: "WagonCoin", business_id: admin_business.id, user_id: admin.id, remote_photo_url: "http://lewagon.github.io/ui-components/images/lewagon.png")

# print "Seeding..."
# data["Data"].each_with_index do |(key,value), i|
#   # just to keep the seed small
#   if i < 5
#     # need a user and business for each token
#     user = User.create!(first_name: fnames[i], last_name: snames[i],  email: snames[i] + "@hotmail.com", password: "123123", remote_photo_url: uphotos[i])
#     business = Business.create!(user_id: user.id, name: businesses[i], address: Faker::Address.city, url: Faker::Internet.url, email: Faker::Internet.email, remote_photo_url: business_photos[i], description: "Businesses that have compelling ethoses end up winning clients even when their prices are not the best in the market or their products or services might not be the most innovative available. Their ethoses may capture the attention of their niches, and their clients develop an emotional attachment.")
#     Token.create!(name: value["CoinName"], business_id: business.id, user_id: user.id, remote_photo_url: base + value["ImageUrl"])
#     Following.create!(user: user, token: admin_token)
#     print "."
#   end
# end

# puts "You're all set"

require 'open-uri'
require 'json'
require 'faker'

# User.destroy_all

base = "https://api.coinmarketcap.com/v1/ticker/"
url = "https://api.coinmarketcap.com/v1/ticker/?convert=GBP&limit=10"
data_array = JSON.parse(open(url).read)

user_first_names = ["Alex", "Jamie", "Leonard", "Guy", "Edward"]
user_second_names = ["Haumer", "Dujardin", "Percival", "Bennett-Jones", "Wardward"]
user_photos = ["https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/22352358_1979202722367603_4743582015956189184_n.jpg", "https://i.pinimg.com/avatars/jamiedujardin_1411542889_280.jpg", "https://i.ytimg.com/vi/JBUGYHcQOAw/maxresdefault.jpg", "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAA1pAAAAJGQyNmI2ZmVlLTg2NTItNGU0NC1iZWFmLTg2NDc4NDY4ZDFiMg.jpg", "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/1/005/051/0ee/3e8e637.jpg"]

businesses = []
tokens = []
prices_gbp = []
market_caps_gbp = []
one_day_volumes_gbp = []
percentage_changes_1h = []
percentage_changes_24h = []
percentage_changes_1w = []
total_supplies = []
max_supplies = []
business_photo_placeholder = "https://statewideguttercompany.com/wp-content/uploads/2012/07/logo-placeholder.jpg"
token_photo_placeholder = "https://bitcoin.org/img/icons/opengraph.png"
description_placeholder = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

# admin account for easy access
  print "Creating Admin..."
  admin = User.create!(first_name: "Alex", last_name: "Benoit", email: "alex@benoit.com", password: "123123", remote_photo_url: "https://avatars3.githubusercontent.com/u/16181471?v=4")
  admin_business = Business.create!(user_id: admin.id, name: "Le Wagon", address: "admin street", url: "admin.com", email: "admin@admin.com", remote_photo_url: "http://lewagon.github.io/ui-components/images/lewagon.png")
  admin_token = Token.create!(name: "WagonCoin", business_id: admin_business.id, user_id: admin.id, remote_photo_url: "http://lewagon.github.io/ui-components/images/lewagon.png")

print "Gathering Data..."
data_array.each do |coin|
  endings = ["Foundation", "Ltd", "Co."]
  business_name = coin["name"] + " " + endings.sample
  businesses << business_name

  tokens << coin["name"]
  prices_gbp << coin["price_gbp"].to_f
  market_caps_gbp << coin["market_cap_gbp"].to_f
  one_day_volumes_gbp << coin["one_day_volumes_gbp"].to_f
  percentage_changes_1h << coin["percent_change_1h"].to_f
  percentage_changes_24h << coin["percent_change_24h"].to_f
  percentage_changes_1w << coin["percent_change_1w"].to_f
  total_supplies << coin["total_supply"].to_f

  if coin["max_supply"].to_f > 0
    max_supply = coin["max_supply"].to_f
  else
    max_supply = "infinite"
  end
  max_supplies << max_supply
  print "."
end

print "Seeding..."
i = 0
# just to keep the seed small
while i < 5
    # need a user and business for each token
    user = User.create!(first_name: user_first_names[i], last_name: user_second_names[i],  email: user_first_names[i] + "@tokinfo.com", password: "123123", remote_photo_url: user_photos[i])
    business = Business.create!(user_id: user.id, name: businesses[i], address: Faker::Address.city, url: Faker::Internet.url, email: Faker::Internet.email, remote_photo_url: business_photo_placeholder, description: "Businesses that have compelling ethoses end up winning clients even when their prices are not the best in the market or their products or services might not be the most innovative available. Their ethoses may capture the attention of their niches, and their clients develop an emotional attachment.")
    Token.create!(name: tokens[i], business_id: business.id, user_id: business.user.id, remote_photo_url: token_photo_placeholder, latest_price_gbp: prices_gbp[i], market_cap_gbp: market_caps_gbp[i], one_day_volume_gbp: one_day_volumes_gbp[i], percentage_change_1h: percentage_changes_1h[i], percentage_change_24h: percentage_changes_24h[i], percentage_change_1w: percentage_changes_1w[1], total_supply: total_supplies[i], max_supply: max_supplies[i])
    Following.create!(user: user, token: admin_token)
    Following.create!(user: user, token: Token.last)
    print "."
    i += 1
end












