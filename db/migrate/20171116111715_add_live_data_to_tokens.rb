class AddLiveDataToTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :tokens, :market_cap_gbp, :float
    add_column :tokens, :one_day_volume_gbp, :float
    add_column :tokens, :percentage_change_1h, :float
    add_column :tokens, :percentage_change_24h, :float
    add_column :tokens, :percentage_change_1w, :float
    add_column :tokens, :total_supply, :float
    add_column :tokens, :max_supply, :float
  end
end
