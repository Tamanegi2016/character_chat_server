class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :to_user_id
      t.integer :from_user_id
      t.timestamp
    end
  end
end
