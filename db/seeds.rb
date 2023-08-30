# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "faker"


puts "Cleaning database... "
Monsters.destroy_all

puts "Creating new monsters....🧌🧌"
Monster.create([{ hitpoints: "20" }, { healthpoints: "100"}, { image_url: "Treasure Keeper/troll_01.png"}, { challenge_id: "1"} ])
Monster.create([{ hitpoints: "20" }, { healthpoints: "100"}, { image_url: "Treasure Keeper/troll_02.png"}, { challenge_id: "2"} ])
Monster.create([{ hitpoints: "20" }, { healthpoints: "100"}, { image_url: "Treasure Keeper/orc_01.png"}, { challenge_id: "3"} ])
Monster.create([{ hitpoints: "20" }, { healthpoints: "100"}, { image_url: "Treasure Keeper/orc_02.png"}, { challenge_id: "4"} ])
Monster.create([{ hitpoints: "20" }, { healthpoints: "100"}, { image_url: "Treasure Keeper/dragon_01.png"}, { challenge_id: "5"} ])
Monster.create([{ hitpoints: "20" }, { healthpoints: "100"}, { image_url: "Treasure Keeper/dragon_02.png"}, { challenge_id: "6"} ])
