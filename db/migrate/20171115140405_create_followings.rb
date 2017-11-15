class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :token, foreign_key: true

      t.timestamps
    end
  end
end
