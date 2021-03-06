# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

200.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.cell_phone
  category = %w[chinese italian japanese french belgian].sample
  restaurant = Restaurant.new({ name: name, address: address, phone_number: phone_number, category: category })
  restaurant.save

  500.times do
    review = Review.new({ rating: rand(6), content: Faker::Restaurant.review, restaurant: restaurant })
    review.save
  end
end
