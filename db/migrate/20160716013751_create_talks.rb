class CreateTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :talks do |t|
      t.int :user_id
      t.varchar :message

      t.timestamps
    end
  end
end
