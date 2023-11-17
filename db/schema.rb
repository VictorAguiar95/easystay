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

ActiveRecord::Schema[7.0].define(version: 2023_11_17_031308) do
  create_table "guesthouses", force: :cascade do |t|
    t.string "trade_name"
    t.string "corporate_name"
    t.string "address"
    t.string "neighborhood"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.string "phone_number"
    t.string "email"
    t.string "cnpj"
    t.boolean "pets_allowed"
    t.integer "quantity_rooms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cep"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_guesthouses_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "size"
    t.integer "qty_people"
    t.boolean "bathroom"
    t.boolean "balcony"
    t.boolean "wi_fi"
    t.boolean "air_conditioning"
    t.boolean "television"
    t.boolean "wardrobe"
    t.boolean "safe"
    t.boolean "accessible_disabled"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guesthouse_id", null: false
    t.index ["guesthouse_id"], name: "index_rooms_on_guesthouse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "lastname"
    t.string "cpf"
    t.date "birth"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "guesthouses", "users"
  add_foreign_key "rooms", "guesthouses"
end
