class AddMessageToNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :no_session_talks, :message, :string
    add_column :no_session_talks, :user_id, :integer
  end
end
