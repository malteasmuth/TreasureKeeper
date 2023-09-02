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

puts "Creating 1  Tresure chest...📦 ."


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


puts "Creating new monsters....🧌🧌  (Actualy not seeding monsters)"

# Seed Monsters
monsters_data = [
  {
    hitpoints: 10.0,
    healthpoints: 50.0,
    image_url: "Orc"
  },
  {
    hitpoints: 15.0,
    healthpoints: 75.0,
    image_url: "Troll"
  },
  {
    hitpoints: 20.0,
    healthpoints: 75.0,
    image_url: "Orc2"
  },
  {
    hitpoints: 30.0,
    healthpoints: 90.0,
    image_url: "Orc3"
  },
  {
    hitpoints: 40.0,
    healthpoints: 90.0,
    image_url: "Dragon"
  }
]
monsters_data.each do |monster_data|
  Monster.create(monster_data)
end

# First, seed the "Challenges" table without the expense_id column.
# Next, seed the "Expenses" table with the challenge_id column, referring to the



puts "Creating some challenges..🌱🌱 (Actualy not seeding challenges)"

# Seed Challenges

# Seed Expenses
expenses_data = [
  { amount: 50.0, expense_date: Date.today - 3.days, player_id: Player.all.pluck(:id).sample },
  { amount: 75.0, expense_date: Date.today - 2.days, player_id: Player.all.pluck(:id).sample }
]

expenses_data.each do |expense_data|
  Expense.create(expense_data)
end
