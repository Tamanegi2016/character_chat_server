class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :no_session_users, :to_user , index: true
      t.references :no_session_users, :from_user , index: true
      t.timestamp
    end
  end
end
