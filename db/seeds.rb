# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "date"

user = User.new(
  email: "test1@test.com",
  username: "test1",
  first_name: "test",
  last_name: "one",
  location: "Testville",
  rank: 4.0,
  elo: 1400,
  image_url: "http://bit.ly/11UkzCF",
  bio: "I'm the best",
  password_digest: Monban.hash_token("password")
)

user.save

user = User.new(
  email: "test2@tester.com",
  username: "test2",
  first_name: "test",
  last_name: "two",
  location: "Testville",
  rank: 5.0,
  elo: 1300,
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

user = User.new(
  email: "test3@tester.com",
  username: "test3",
  first_name: "test",
  last_name: "three",
  location: "Testville",
  rank: 5.0,
  elo: 1200,
  image_url: "http://bit.ly/11UkzCF",
  bio: "I'm the greatest",
  password_digest: Monban.hash_token("password")
)

user.save

user = User.new(
  email: "test4@tester.com",
  username: "test4",
  first_name: "test",
  last_name: "four",
  location: "Testville",
  rank: 5.0,
  elo: 1500,
  image_url: "http://bit.ly/11UkzCF",
  bio: "I'm the greatest",
  password_digest: Monban.hash_token("password")
)

user.save

match_request = MatchRequest.new(
  requester_id: 1,
  opponent_id: 2,
  request_message: "Match?",
  start_date: DateTime.now,
  end_date: DateTime.now + 20,
  confirmed: false,
  match_at: DateTime.now + 10
)

match_request.save

match = Match.new(
  challenger_id: 1,
  defender_id: 2,
  match_at: DateTime.now,
  winner_id: 1,
  challenger_elo: 1500,
  defender_elo: 1400,
  elo_delta: 10
)

match.save

match = Match.new(
  challenger_id: 1,
  defender_id: 2,
  match_at: DateTime.now,
  winner_id: 1,
  challenger_elo: 1500,
  defender_elo: 1400,
  elo_delta: 10
)

match.save

match = Match.new(
  challenger_id: 1,
  defender_id: 2,
  match_at: DateTime.now,
  winner_id: 2,
  challenger_elo: 1500,
  defender_elo: 1400,
  elo_delta: 10
)

match.save

match = Match.new(
  challenger_id: 1,
  defender_id: 2,
  match_at: DateTime.now,
  winner_id: 1,
  challenger_elo: 1500,
  defender_elo: 1400,
  elo_delta: 10
)

match.save
