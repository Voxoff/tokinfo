class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :name
      t.references :businesses, foreign_key: true

      t.timestamps
    end
  end
end
