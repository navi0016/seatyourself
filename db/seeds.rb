# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all


name = ["Sushitto", "Noise", "We Got Fish", "Tacos Tacos Tacos", "We Got Food!"]

email = ["sushitto@gmail.com", "noise@gmail.com", "fish@gmail.com", "tacos@gmail.com", "food@gmail.com"]

location = ["China Town", "Financial District", "Kensington Market", "The Junction", "Cabbage Town"]

type_of_foods = ["Japanese", "American Nuevo", "Seafood", "Tex-Mex", "All You Can Eat"]

start_time = (Time.now.beginning_of_day)

end_time = (Time.now.end_of_day)

capacity = Random.new

5.times do
  Restaurant.create! name: name.sample, email: email.sample, location: location.sample, type_of_food: type_of_foods.sample, start_time: start_time, end_time: end_time, capacity: capacity.rand(50..150)
end
