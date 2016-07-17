class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :to_user
      t.integer :from_user
      t.timestamp
    end
  end
end
