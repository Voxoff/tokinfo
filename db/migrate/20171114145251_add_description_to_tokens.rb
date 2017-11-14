class AddDescriptionToTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :tokens, :description, :text
  end
end
