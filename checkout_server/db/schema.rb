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

ActiveRecord::Schema[7.0].define(version: 2022_11_29_205128) do
  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.bigint "external_reference_id", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "product_id", null: false
    t.bigint "external_user_id", null: false
    t.string "status", default: "pending", null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  add_foreign_key "purchases", "products"
end
