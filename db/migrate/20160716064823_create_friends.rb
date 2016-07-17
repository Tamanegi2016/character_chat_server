class CreateFriends < ActiveRecord::Migration[5.0]
      belongs_to :to_user, class_name: "CreateNoSessionUsers", foreign_key: :no_session_users_id
      belongs_to :from_user, class_name: "CreateNoSessionUsers", foreign_key: :no_session_users_id
      t.timestamp
end
