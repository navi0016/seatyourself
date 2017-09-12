class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|

      t.string :name
      t.string :email
      t.string :location
      t.string :type_of_food
      t.time :start_time
      t.time :end_time
      t.integer :capacity

      t.timestamps
    end
  end
end
