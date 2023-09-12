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

ActiveRecord::Schema[7.0].define(version: 2023_09_12_131202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status", default: 0
    t.bigint "player_id", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monster_id"
    t.bigint "expense_id"
    t.float "budget"
    t.float "current_value", default: 0.0
    t.bigint "treasure_chest_id"
    t.index ["expense_id"], name: "index_challenges_on_expense_id"
    t.index ["monster_id"], name: "index_challenges_on_monster_id"
    t.index ["player_id"], name: "index_challenges_on_player_id"
    t.index ["treasure_chest_id"], name: "index_challenges_on_treasure_chest_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.date "expense_date"
    t.bigint "player_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["challenge_id"], name: "index_expenses_on_challenge_id"
    t.index ["player_id"], name: "index_expenses_on_player_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.float "hitpoints"
    t.float "healthpoints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.bigint "challenge_id"
    t.index ["challenge_id"], name: "index_monsters_on_challenge_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "avatar_url"
    t.float "hitpoints", default: 20.0
    t.float "healthpoints", default: 100.0
    t.float "rubies", default: 50.0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "level", default: 1
    t.integer "experience_points", default: 0
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "treasure_chests", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "value"
    t.integer "status", default: 0
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "current_value", default: 0.0
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
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "challenges", "expenses"
  add_foreign_key "challenges", "monsters"
  add_foreign_key "challenges", "players"
  add_foreign_key "challenges", "treasure_chests"
  add_foreign_key "expenses", "challenges"
  add_foreign_key "expenses", "players"
  add_foreign_key "monsters", "challenges"
  add_foreign_key "players", "users"
  add_foreign_key "treasure_chests", "players"
end
