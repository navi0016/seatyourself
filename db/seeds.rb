# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all
User.delete_all
Reservation.delete_all


name = ["Sushitto", "Noise", "We Got Fish", "Tacos Tacos Tacos", "We Got Food!"]

email = ["sushitto@gmail.com", "noise@gmail.com", "fish@gmail.com", "tacos@gmail.com", "food@gmail.com"]

location = ["China Town", "Financial District", "Kensington Market", "The Junction", "Cabbage Town"]

type_of_foods = ["Japanese", "American Nuevo", "Seafood", "Tex-Mex", "All You Can Eat"]

start_time = Time.now.beginning_of_day + 60*60*5

end_time = Time.now.end_of_day - 60*60*5

capacity = Random.new

5.times do |i|
  Restaurant.create! name: name[i-1], email: email[i-1], location: location[i-1], type_of_food: type_of_foods[i-1], start_time: start_time, end_time: end_time, capacity: capacity.rand(50..150)
end

user_name = ['joe','bob','sue','gurjant','phil','john','mary','tom','sarah','navi']

10.times do |i|
  User.create! name: user_name[i-1], email: user_name[i-1]+"@gmail.com", phone_number: rand(000..999).to_s + "-" + rand(000..999).to_s + "-" + rand(0000..9999).to_s
end

20.times do
  res = Restaurant.all.sample
  Reservation.create! reservation_time: rand(res.start_time..res.end_time) , party_size: rand(2..10) , user_id:User.all.sample.id , restaurant_id: res.id
end
