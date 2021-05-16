class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :length
      t.date :date
      t.time :time
      t.references :host, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
