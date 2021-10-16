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

ActiveRecord::Schema.define(version: 2021_10_16_041326) do

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_numbers"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "code"
    t.date "start_date"
    t.date "end_date"
    t.integer "guest_id", null: false
    t.string "currency"
    t.integer "nights"
    t.integer "number_of_guests"
    t.string "status"
    t.decimal "total_paid_amount"
    t.integer "adults"
    t.integer "children"
    t.integer "infants"
    t.decimal "payout_amount"
    t.decimal "security_amount"
    t.decimal "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
  end

  add_foreign_key "reservations", "guests"
end
