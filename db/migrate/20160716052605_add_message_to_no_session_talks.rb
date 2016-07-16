class AddMessageToNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :no_session_talks, :message, :string
    add_reference :no_session_talks, :no_session_users , foreign_key: true
  end
end
