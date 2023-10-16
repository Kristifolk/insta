class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friendly_unfriendly

      t.timestamps
    end
  end
end
