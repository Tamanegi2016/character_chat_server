class CreateNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :no_session_talks do |t|

      t.timestamps
    end
  end
end
