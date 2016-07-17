class FixFriend < ActiveRecord::Migration[5.0]
  def change
    rename_column :friend, :to_user, :to_user_id
    rename_column :friend, :from_user, :from_user_id
  end
end
