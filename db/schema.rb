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

ActiveRecord::Schema.define(version: 2019_01_17_014814) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "products_id"
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

  create_table "order_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "users_id"
    t.float "total_price"
    t.integer "status", default: 0, null: false
    t.integer "close_at"
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.string "description_sort"
    t.text "description_long"
    t.string "name_image"
    t.string "color"
    t.string "size"
    t.float "price_in"
    t.float "price_sale"
    t.float "price_out"
    t.integer "status", default: 0, null: false
    t.boolean "new"
    t.integer "quantity"
    t.boolean "trend", default: false
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

  create_table "ratings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "value_rate"
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.integer "sex"
    t.integer "role", default: 0, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", default: "2019-02-15 05:48:32", null: false
    t.datetime "updated_at"
  end

end
