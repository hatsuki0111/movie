class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table "reservations", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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
    add_foreign_key "reservations", "schedules", name: "reservations_schedule_id"
  add_foreign_key "reservations", "sheets", name: "reservations_sheet_id"
  
    # create_table :reservations do |t|

    #   t.timestamps
    # end
  end
end
