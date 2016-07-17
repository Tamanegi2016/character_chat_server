class CreateNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :no_session_talks do |t|
      t.references :no_session_user_id
      t.references :friend
      t.timestamps
    end
  end
end
