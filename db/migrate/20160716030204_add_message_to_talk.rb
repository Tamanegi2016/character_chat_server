class AddMessageToTalk < ActiveRecord::Migration[5.0]
  def change
    add_column :talks, :message, :string
    add_column :talks, :user_id, :integer
  end
end
