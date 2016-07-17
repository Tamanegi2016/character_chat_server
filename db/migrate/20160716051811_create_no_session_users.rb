class CreateNoSessionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :no_session_users do |t|
      t.timestamps
    end
  end
end
