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

ActiveRecord::Schema.define(version: 3) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.integer "my_rating"
  end

  create_table "inspections", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "violation_id"
    t.string  "date"
    t.string  "grade"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.integer "zipcode"
    t.string  "cuisine"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  create_table "violations", force: :cascade do |t|
    t.string  "code"
    t.string  "description"
    t.boolean "critical"
  end

end
