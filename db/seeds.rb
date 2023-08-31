# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "faker"


puts "Cleaning database.....one time Seed "

User.destroy_all
Player.destroy_all
Monster.destroy_all
Challenge.destroy_all
Expense.destroy_all

puts "Creating 4 users...."


# this not secure, but we dont care about that, at devise you should, seed the password field, not the enc
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
  { avatar_url: "Treasure Keeper/swordman.png", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player1", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Treasure Keeper/wizard.png", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player2", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Treasure Keeper/knight.png", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player3", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Treasure Keeper/swordman.png", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player4", user_id: User.all.pluck(:id).sample }
]

players_data.each do |player_data|
  Player.create(player_data)
end


puts "Creating new monsters....🧌🧌"

# Seed Monsters
monsters_data = [
  {
    hitpoints: 10.0,
    healthpoints: 50.0,
    image_url: "Treasure Keeper/troll_01.png"
  },
  {
    hitpoints: 15.0,
    healthpoints: 75.0,
    image_url: "Treasure Keeper/troll_02.png"
  },
  {
    hitpoints: 20.0,
    healthpoints: 75.0,
    image_url: "Treasure Keeper/orc_01.png"
  },
  {
    hitpoints: 20.0,
    healthpoints: 90.0,
    image_url: "Treasure Keeper/orc_02.png"
  },
  {
    hitpoints: 55.0,
    healthpoints: 90.0,
    image_url: "Treasure Keeper/dragon_01.png"
  },
  {
    hitpoints: 90.0,
    healthpoints: 90.0,
    image_url: "Treasure Keeper/dragon_02.png"
  }
]

monsters_data.each do |monster_data|
  Monster.create(monster_data)
end


# First, seed the "Challenges" table without the expense_id column.
# Next, seed the "Expenses" table with the challenge_id column, referring to the

puts "Creating some challenges..🌱🌱"

# Seed Challenges
challenges_data = [
  {
    name: "Challenge 1",
    description: "Description 1",
    status: 0,
    player_id: Player.all.pluck(:id).sample, # the first player that exist if we do not drop the DB
    end_date: Date.today + 7.days,
    monster_id: Monster.all.pluck(:id).sample, # this is a troll
    budget: 100.0,
    current_value: 50.0,
  },
  {
    name: "Challenge 2",
    description: "Description 2",
    status: 0,
    player_id: Player.all.pluck(:id).sample,
    end_date: Date.today + 14.days,
    monster_id: Monster.all.pluck(:id).sample, # a Dragon here!
    budget: 150.0,
    current_value: 100.0,
  }
]
<<<<<<< HEAD
=======
# puts "Creating some challenges..🌱🌱"

# # Clear existing data
# # Challenge.destroy_all

# # Seed Challengee
# Clear existing data
# Challenge.destroy_all

# Seed Challenges

# challenges_data = [
#   {
#     name: "Challenge 1",
#     description: "Description 1",
#     status: 0,
#     player_id: 22, # the first player that exist if we do not drop the DB
#     end_date: Date.today + 7.days,
#     monster_id: 7, # this is a troll
#     budget: 100.0,
#     current_value: 50.0,
#   },
#   {
#     name: "Challenge 2",
#     description: "Description 2",
#     status: 0,
#     player_id: 23,
#     end_date: Date.today + 14.days,
#     monster_id: 10, # a Dragon here!
#     budget: 150.0,
#     current_value: 100.0,
#   }
# ]
>>>>>>> f021f167d9417d59a9830ef3984d720b6398193f
=======
>>>>>>> 11b24286eb30d957065621eb25433f91c318be6d

challenges_data.each do |challenge_data|
  Challenge.create(challenge_data)
end

# Seed Expenses
expenses_data = [
  { amount: 50.0, expense_date: Date.today - 3.days, player_id: 22  },
  { amount: 75.0, expense_date: Date.today - 2.days, player_id: 23  },
]

expenses_data.each do |expense_data|
  Expense.create(expense_data)
end
