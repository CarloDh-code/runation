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

ActiveRecord::Schema[7.1].define(version: 2024_11_29_093229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["player_id"], name: "index_comments_on_player_id"
  end

  create_table "game_player_runs", force: :cascade do |t|
    t.bigint "game_player_id", null: false
    t.bigint "run_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_player_id"], name: "index_game_player_runs_on_game_player_id"
    t.index ["run_id"], name: "index_game_player_runs_on_run_id"
  end

  create_table "game_players", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.integer "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["player_id"], name: "index_game_players_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "map_polyline"
    t.integer "nb_of_players"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.boolean "read", default: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_notifications_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "nickname"
    t.string "uid"
    t.string "token"
    t.string "refresh_token"
    t.string "title"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "runs", force: :cascade do |t|
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.float "start_lat"
    t.float "end_lat"
    t.float "start_long"
    t.float "end_long"
    t.text "polyline"
    t.bigint "strava_activity_id"
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_runs_on_player_id"
  end

  add_foreign_key "comments", "games"
  add_foreign_key "comments", "players"
  add_foreign_key "game_player_runs", "game_players"
  add_foreign_key "game_player_runs", "runs"
  add_foreign_key "game_players", "games"
  add_foreign_key "game_players", "players"
  add_foreign_key "notifications", "players"
  add_foreign_key "runs", "players"
end
