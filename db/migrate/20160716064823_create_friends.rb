class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :to_user, :null => false
      t.integer :from_user, :null => false
      t.timestamp
  end
end
