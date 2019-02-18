# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "generating 10 random users"

10.times do
  User.create(email: Faker::Internet.email, password: "123456", address: Faker::Address.street_address, is_athlete: [true, false].sample)
end

User.all.each do |user|
  if user.is_athlete
    Athlete.create(first_name: Faker::Name.name, last_name: Faker::Name.name, birth_date: Date.new, cpf: 23, user: user)
  else
    Brand.create(name: Faker::Name.name, slogan: Faker::Name.name, cnpj: 10, user: user)
  end
end

puts "done!"
