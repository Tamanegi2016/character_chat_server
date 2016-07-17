class AddMessageToNoSessionTalks < ActiveRecord::Migration[5.0]
  def change
    add_column :no_session_talks, :message, :string
  end
end
