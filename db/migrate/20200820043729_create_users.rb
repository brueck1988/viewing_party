class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
    add_index :users, :uid
    add_index :users, :username
  end
end
