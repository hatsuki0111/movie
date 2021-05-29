class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table "schedules", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.bigint "movie_id", null: false
      t.time "start_time", null: false, comment: "上映開始時刻"
      t.time "end_time", null: false, comment: "上映終了時刻"
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["movie_id"], name: "movie_id_idx"
    end
    # create_table :schedules do |t|

    #   t.references:movie, :null => false, index: true, foreign_key: true, visible: true, on_delete: :restrict, on_update: :restrict
    #   t.time:start_time, :null => false
    #   t.time:end_time, :null => false

    #   t.timestamps
    # end

  end

end