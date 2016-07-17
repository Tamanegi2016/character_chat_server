class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :to_user, class_name: "CreateNoSessionUsers", foreign_key: :no_session_users_id
      t.references :from_user, class_name: "CreateNoSessionUsers", foreign_key: :no_session_users_id
      t.timestamp
    end
  end
end
