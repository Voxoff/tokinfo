class AddPhotoToBusiness < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :photo, :string
  end
end
