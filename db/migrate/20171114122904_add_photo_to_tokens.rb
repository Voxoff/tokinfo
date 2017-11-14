class AddPhotoToTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :tokens, :photo, :string
  end
end
