class AddMessageToNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :no_session_talks, :message, :string
    add_reference :no_session_talks, :friends
    add_reference :no_session_talks, :users
  end
end
