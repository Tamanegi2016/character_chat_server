class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :to_user, :no_session_users , index: true
      t.references :from_user, :no_session_users , index: true
      t.timestamp
    end
  end
end
