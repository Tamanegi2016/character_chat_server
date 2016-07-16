class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :to_user_id, :no_session_users , :null => false , foreign_key: true
      t.references :from_user_id, :no_session_users , :null => false , foreign_key: true
      t.timestamp
    end
  end
end

