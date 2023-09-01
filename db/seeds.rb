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
  { avatar_url: "Elf", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player1", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Knight", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player2", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Queen", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player3", user_id: User.all.pluck(:id).sample },
  { avatar_url: "Swords", hitpoints: 20.0, healthpoints: 100.0, rubies: 50.0, username: "player4", user_id: User.all.pluck(:id).sample }
]

players_data.each do |player_data|
  Player.create(player_data)
end

player = Player.create(players_data)


puts "Creating new monsters....🧌🧌"

# Seed Monsters
monsters_data = [
  {
    hitpoints: 10.0,
    healthpoints: 50.0,
    image_url: "../app/assets/images/Icons/orc2.png"
  },
  {
    hitpoints: 15.0,
    healthpoints: 75.0,
    image_url: "../app/assets/images/Icons/orc3.png"
  },
  {
    hitpoints: 20.0,
    healthpoints: 75.0,
    image_url: "../app/assets/images/Icons/troll.png"
  },
  {
    hitpoints: 20.0,
    healthpoints: 90.0,
    image_url: "../app/assets/images/Icons/dragon2.png"
  },
  {
    hitpoints: 55.0,
    healthpoints: 90.0,
    image_url: "../app/assets/images/Icons/dragon1.png"
  },
  {
    hitpoints: 90.0,
    healthpoints: 90.0,
    image_url: "../app/assets/images/Icons/dragon2.png"
  }

]
monsters_data.each do |monster_data|
  Monster.create(monster_data)
end

# First, seed the "Challenges" table without the expense_id column.
# Next, seed the "Expenses" table with the challenge_id column, referring to the

treasure_1 = TreasureChest.create({

  name: "treasure_2",
  description: "asd",
  value: 2134,
  player_id: player

})
treasure_2 = TreasureChest.create({

  name: "treasure_1",
  description: "asd",
  value: 2134,
  player_id: player

})
treasure_3 = TreasureChest.create({

  name: "treasure_3",
  description: "asd",
  value: 2134
})

puts "Creating some challenges..🌱🌱"

# Seed Challenges

# Seed Expenses
expenses_data = [
  { amount: 50.0, expense_date: Date.today - 3.days, player_id: 22  },
  { amount: 75.0, expense_date: Date.today - 2.days, player_id: 23  },
]

expenses_data.each do |expense_data|
  Expense.create(expense_data)
end
