class GetPricesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    base = "https://api.coinmarketcap.com/v1/ticker/"
    tokens = Token.all

    tokens.each do |token|
      token_url_id = token.name.downcase.tr(" ", "-")
      url = "#{base}#{token_url_id}/?convert=GBP"
      token_data = JSON.parse(open(url).read)

      token.market_cap_gbp = token_data["market_cap_gbp"]
      token.one_day_volume_gbp = token_data["24h_volume_gbp"]
      token.percentage_change_1h = token_data["percent_change_1h"]
      token.percentage_change_24h = token_data["percent_change_24h"]
      token.percentage_change_1w = token_data["percent_change_1w"]
      token.total_supply = token_data["total_supply"]
    end

  end
end
