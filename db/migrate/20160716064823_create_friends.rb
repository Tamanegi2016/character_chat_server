class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :friends , :no_session_users , :null => false , foreign_key: true
      t.references :no_session_users , :null => false , foreign_key: true
      t.timestamp
    end
  end
end
