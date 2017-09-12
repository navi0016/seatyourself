class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_time
      t.integer :party_size
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
