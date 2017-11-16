class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.float :value_gbp
      t.references :token, foreign_key: true

      t.timestamps
    end
  end
end
