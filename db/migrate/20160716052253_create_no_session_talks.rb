class CreateNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :no_session_talks do |t|
      t.timestamps
      #t.references :no_session_user, index: true, foreign_key: true
    end
  end
end
