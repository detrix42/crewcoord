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

ActiveRecord::Schema[7.1].define(version: 2024_05_06_034504) do
  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
  end

  create_table "crew_members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "is_crew_manager", default: false
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "email_verified", default: false
    t.index ["business_id"], name: "index_crew_members_on_business_id"
    t.index ["email"], name: "index_crew_members_on_email"
    t.index ["phone"], name: "index_crew_members_on_phone"
  end

  create_table "crews", force: :cascade do |t|
    t.integer "business_id", null: false
    t.integer "crew_member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_crews_on_business_id"
    t.index ["crew_member_id"], name: "index_crews_on_crew_member_id"
  end

  create_table "manager_confirmations", force: :cascade do |t|
    t.integer "manager_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "password_reset_codes", force: :cascade do |t|
    t.string "code"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "shards" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  add_foreign_key "crews", "businesses"
  add_foreign_key "crews", "crew_members"
  add_foreign_key "shards", "crew_members"
end
