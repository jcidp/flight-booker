class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.integer :duration
      t.integer :departure_airport_id
      t.integer :arrival_airport_id

      t.timestamps
    end
  end
end
