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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_222149) do
  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.text "description", null: false
    t.string "color", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.boolean "completed", default: false, null: false
    t.integer "users_id", null: false
    t.integer "products_id", null: false
    t.index ["products_id"], name: "index_purchases_on_products_id"
    t.index ["users_id"], name: "index_purchases_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
  end

end
