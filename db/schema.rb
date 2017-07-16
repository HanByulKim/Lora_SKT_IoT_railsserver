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

ActiveRecord::Schema.define(version: 20170716155842) do

  create_table "reqs", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "ty"
    t.string   "ri"
    t.string   "rn"
    t.string   "pi"
    t.datetime "ct"
    t.datetime "lt"
    t.string   "gwl"
    t.float    "lat"
    t.float    "lng"
    t.string   "geui"
    t.string   "sr"
    t.string   "app_eui"
    t.string   "ltid"
    t.datetime "et"
    t.integer  "st"
    t.string   "cr"
    t.string   "cnf"
    t.integer  "cs"
    t.string   "con"
    t.integer  "PM2_5"
    t.integer  "PM10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
