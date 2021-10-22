# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(email: "test@test.com", password: 112233)
10.times do
  make = Make.create(name: Faker::Vehicle.manufacture)
  make.vehicles.create(model:  Faker::Vehicle.model)
end
