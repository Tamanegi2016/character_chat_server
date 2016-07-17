class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :to_user, foreign_key: no_session_users
      t.references :from_user, foreign_key: no_session_users
      t.timestamp
    end
  end
end
