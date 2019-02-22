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

puts "generating 2 'admin' users (User(id:1) as athlete | User(id: 2) as brand)"

  admin1 = User.create(email: "athlete@test.com", password: "123456", address: Faker::Address.street_address, is_athlete: true)
  admin2 = User.create(email: "brand@test.com", password: "123456", address: Faker::Address.street_address, is_athlete: false)
  admin3 = User.create(email: "link@test.com", password: "123456", address: "P. Sherman, 42 Wallaby Way, Sydney", is_athlete: true)
  admin4 = User.create(email: "mary@test.com", password: "123456", address: "P. Sherman, 42 Wallaby Way, Sydney", is_athlete: true)
  admin5 = User.create(email: "nemo@test.com", password: "123456", address: "P. Sherman, 42 Wallaby Way, Sydney", is_athlete: true)
  admin6 = User.create(email: "mario@test.com", password: "123456", address: "P. Sherman, 42 Wallaby Way, Sydney", is_athlete: true)
  admin7 = User.create(email: "nintendo@test.com", password: "123456", address: Faker::Address.street_address, is_athlete: false)
  admin8 = User.create(email: "marvel@test.com", password: "123456", address: Faker::Address.street_address, is_athlete: false)
  admin9 = User.create(email: "disney@test.com", password: "123456", address: Faker::Address.street_address, is_athlete: false)
  Athlete.create(first_name: "Roger", last_name: "Federer", birth_date: Date.new, cpf: 24, achievements: "Best tennis player", user: admin1)
  Athlete.create(first_name: "Link", last_name: "From Zelda", birth_date: Date.new, cpf: 24, achievements: "Defeating Ganon", user: admin3)
  Athlete.create(first_name: "Mary", last_name: "Jane", birth_date: Date.new, cpf: 24, achievements: "Date Spiderman", user: admin4)
  Athlete.create(first_name: "Nemo", last_name: "FindMe", birth_date: Date.new, cpf: 24, achievements: "Getting terribly lost", user: admin5)
  Athlete.create(first_name: "Mario", last_name: "SuperIam", birth_date: Date.new, cpf: 24, achievements: "Defeating Bowser and saving Peach", user: admin6)
  Brand.create(name: "Nike", slogan: "just do it", cnpj: 10, user: admin2)
  Brand.create(name: "Nintendo", slogan: "there's no play like it", cnpj: 100, user: admin7)
  Brand.create(name: "Marvel", slogan: "selling comics, making memories", cnpj: 150, user: admin8)
  Brand.create(name: "Disney", slogan: "where dreams come true", cnpj: 170, user: admin9)

puts "done!"
