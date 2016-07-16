class AddNameToNoSessionUser < ActiveRecord::Migration[5.0]
  def change
    add_column :no_session_users, :name, :string
    add_column :no_session_users, :profile_url, :string
  end
end
