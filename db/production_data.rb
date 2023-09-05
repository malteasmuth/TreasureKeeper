
puts "❌ Cleaning database...in Production ❌"

Expense.destroy_all
TreasureChest.destroy_all
Challenge.destroy_all
Monster.destroy_all
Player.destroy_all
User.destroy_all

puts "❌ Creating 4 users..in Production ❌"

users_data = [
  { email: "romeo@example.com", password: "123456" },
  { email: "malte@example.com", password: "123456" },
  { email: "sebas@example.com", password: "123456" },
  { email: "victor@example.com", password: "123456" }
]
users_data.each do |user_data|
  User.create(user_data)
end
