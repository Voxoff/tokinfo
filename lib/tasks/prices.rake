require 'faraday'
require 'open-uri'
require 'json'

namespace :prices do
  task fetch: :environment do
    tokens = Token.all

    tokens.each do |token|
      token_url_id = token.name.downcase.tr(" ", "-")
      url = "https://api.coinmarketcap.com/v1/ticker/#{token_url_id}/?convert=GBP"
      begin
        token_data = JSON.parse(open(url).read).first

        token.market_cap_gbp = token_data["market_cap_gbp"]
        token.one_day_volume_gbp = token_data["24h_volume_gbp"]
        token.percentage_change_1h = token_data["percent_change_1h"]
        token.percentage_change_24h = token_data["percent_change_24h"]
        token.percentage_change_1w = token_data["percent_change_1w"]
        token.total_supply = token_data["total_supply"]

        price = Price.new(value_gbp: token_data["price_gbp"], token: token)
        puts "New Price for #{token_url_id} of #{price.value_gbp}"
      rescue OpenURI::HTTPError
        puts "HTTP error! for #{token_url_id}!!"
      end
    end
  end
end
