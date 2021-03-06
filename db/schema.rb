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

ActiveRecord::Schema.define(version: 2021_05_29_042144) do

  create_table "movies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 160, null: false
    t.string "year", limit: 45
    t.text "description"
    t.string "image_url", limit: 150
    t.boolean "is_showing", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date", null: false
    t.integer "schedule_id", null: false
    t.bigint "sheet_id", null: false
    t.string "email", null: false, comment: "予約者メールアドレス"
    t.string "name", limit: 50, null: false, comment: "予約者名"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["date", "schedule_id", "sheet_id"], name: "reservations_schedule_sheet_unique", unique: true
    t.index ["schedule_id"], name: "reservations_schedule_id_idx"
    t.index ["sheet_id"], name: "reservations_sheet_id_idx"
  end

  create_table "schedules", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.time "start_time", null: false, comment: "上映開始時刻"
    t.time "end_time", null: false, comment: "上映終了時刻"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["movie_id"], name: "movie_id_idx"
  end

  create_table "sheets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "column", null: false
    t.string "row", limit: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reservations", "schedules", name: "reservations_schedule_id"
  add_foreign_key "reservations", "sheets", name: "reservations_sheet_id"
  add_foreign_key "schedules", "movies", name: "movie_id"
end
