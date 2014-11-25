# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(
  email: "test@test.com",
  username: "elikim",
  first_name: "Elijah",
  last_name: "Kim",
  location: "New Jersey",
  rank: 4.0,
  elo: 1400,
  image_url: "http://bit.ly/11UkzCF",
  bio: "I'm the best",
  password_digest: Monban.hash_token("password")
)

user.save

user = User.new(
  email: "tester@tester.com",
  username: "eli",
  first_name: "Bob",
  last_name: "Ert",
  location: "New Jersey",
  rank: 5.0,
  elo: 1400,
  image_url: "http://bit.ly/11UkzCF",
  bio: "I'm the greatest",
  password_digest: Monban.hash_token("password")
)

user.save

user = User.new(
  email: "admin@admin.com",
  username: "admin",
  first_name: "Admin",
  last_name: "Ator",
  location: "New Jersey",
  rank: 5.0,
  elo: 1400,
  image_url: "http://bit.ly/11UkzCF",
  bio: "I'm the greatest",
  password_digest: Monban.hash_token("password")
)

user.save
