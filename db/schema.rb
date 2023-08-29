# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_29_145604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status"
    t.bigint "player_id", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monster_id"
    t.bigint "expense_id"
    t.index ["expense_id"], name: "index_challenges_on_expense_id"
    t.index ["monster_id"], name: "index_challenges_on_monster_id"
    t.index ["player_id"], name: "index_challenges_on_player_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.date "expense_date"
    t.bigint "player_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_expenses_on_challenge_id"
    t.index ["player_id"], name: "index_expenses_on_player_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.float "hitpoints"
    t.float "healthpoints"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "creature_type"
  end

  create_table "players", force: :cascade do |t|
    t.string "avatar_url"
    t.float "hitpoints"
    t.float "healthpoints"
    t.float "rubies"
    t.float "balance"
    t.integer "level"
    t.string "objective"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "treasure_chests", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "value"
    t.integer "status"
    t.bigint "player_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_treasure_chests_on_challenge_id"
    t.index ["player_id"], name: "index_treasure_chests_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "challenges", "expenses"
  add_foreign_key "challenges", "monsters"
  add_foreign_key "challenges", "players"
  add_foreign_key "expenses", "challenges"
  add_foreign_key "expenses", "players"
  add_foreign_key "players", "users"
  add_foreign_key "treasure_chests", "challenges"
  add_foreign_key "treasure_chests", "players"
end
