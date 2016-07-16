class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :no_session_talks , foreign_key: true
      t.timestamps
    end
  end
end
