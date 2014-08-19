# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140819064459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.string   "grade"
    t.string   "location"
    t.string   "dowm"
    t.string   "time"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", force: true do |t|
  end

  create_table "jobs", force: true do |t|
    t.integer  "tutor_id"
    t.integer  "employer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutors", force: true do |t|
    t.text   "description"
    t.string "education_level"
    t.string "institute"
    t.string "gender"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "userable_id"
    t.string   "userable_type"
  end

  add_index "users", ["userable_id", "userable_type"], name: "index_users_on_userable_id_and_userable_type", using: :btree

end
