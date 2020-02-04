# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_04_034543) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "avatar"
    t.integer "active_status"
    t.string "activation_digest"
    t.string "remember_digest"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "tour_id"
    t.integer "amount"
    t.bigint "total_price"
    t.integer "status"
    t.string "rated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_bookings_on_account_id"
    t.index ["tour_id"], name: "index_bookings_on_tour_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "review_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "delayed_jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tour_id"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_images_on_tour_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "review_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_likes_on_account_id"
    t.index ["review_id"], name: "index_likes_on_review_id"
  end

  create_table "rattings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "tour_id"
    t.bigint "booking_id"
    t.float "star"
    t.text "comment"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_rattings_on_account_id"
    t.index ["booking_id"], name: "index_rattings_on_booking_id"
    t.index ["tour_id"], name: "index_rattings_on_tour_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "tour_id"
    t.text "title"
    t.text "content"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_reviews_on_account_id"
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
  end

  create_table "tours", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "category_id"
    t.text "title"
    t.text "content"
    t.string "image"
    t.float "avg_rate"
    t.integer "rate_amount"
    t.bigint "price"
    t.integer "status"
    t.datetime "start_day"
    t.datetime "end_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "created_at"], name: "index_tours_on_account_id_and_created_at"
    t.index ["account_id"], name: "index_tours_on_account_id"
    t.index ["category_id"], name: "index_tours_on_category_id"
  end

  add_foreign_key "bookings", "accounts"
  add_foreign_key "bookings", "tours"
  add_foreign_key "comments", "accounts"
  add_foreign_key "comments", "reviews"
  add_foreign_key "images", "tours"
  add_foreign_key "likes", "accounts"
  add_foreign_key "likes", "reviews"
  add_foreign_key "rattings", "accounts"
  add_foreign_key "rattings", "bookings"
  add_foreign_key "rattings", "tours"
  add_foreign_key "reviews", "accounts"
  add_foreign_key "reviews", "tours"
  add_foreign_key "tours", "accounts"
  add_foreign_key "tours", "categories"
end
