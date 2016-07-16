class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.references :friends , :users , :null => false
      t.references :users , :null => false
      t.timestamps
    end
  end
end
