class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.varchar :name
      t.varchar :profile

      t.timestamps
    end
  end
end
