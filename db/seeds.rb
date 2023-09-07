# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "faker"


puts "Cleaning database..... "

Expense.destroy_all
TreasureChest.destroy_all
Challenge.destroy_all
Monster.destroy_all
Player.destroy_all
User.destroy_all
puts "Creating 4 users...."

users_data = [
  { email: "romeo@example.com", password: "123456" },
  { email: "malte@example.com", password: "123456" },
  { email: "sebas@example.com", password: "123456" },
  { email: "victor@example.com", password: "123456" }
]

users_data.each do |user_data|
  User.create(user_data)
end

 puts "Creating 4 Players one per user .."

# Seed Players
players_data = [
  { avatar_url: "Elf", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player1", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Knight", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player2", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Queen", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player3", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Swords", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player4", user_id: User.all.pluck(:id).sample }
]

players_data.each do |player_data|
  Player.create(player_data)
end

puts "Creating 1 Tresure chest...📦 ."


treasure_chest_data =[
{
  name: "treasure_1",
  description: "asd",
  value: 2134,
  player_id: Player.all.pluck(:id).sample
}
]
treasure_chest_data.each do |treasure_data|
  TreasureChest.create(treasure_data)
end

puts "Creating 1 Challenge ...🔮."

Challenge.create(
  name: "bad habits",
  status: 0,
  player_id: Player.all.sample.id,
  end_date: Date.today + 7.days,
  budget: 200.0,
  current_value: 0.0,
  treasure_chest_id: TreasureChest.all.sample.id
)

puts "Creating 1 expense ...💰."

Expense.create(
  amount: 50.0,
  expense_date: Date.today - 3.days,
  player_id: Player.all.sample.id,
  challenge_id: Challenge.all.sample.id,
  category: "bad habits"
)

puts "Creating 3 monsters ...🧌🧌🧌"

Monster.create(hitpoints: 10.0, healthpoints: 50.0, image_url: "Orc", challenge_id: Challenge.all.sample.id)
Monster.create(hitpoints: 15.0, healthpoints: 75.0, image_url: "Troll", challenge_id: Challenge.all.sample.id)
Monster.create(hitpoints: 15.0, healthpoints: 75.0, image_url: "Dragon", challenge_id: Challenge.all.sample.id)

puts "Seed data created successfully."
