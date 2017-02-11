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

ActiveRecord::Schema.define(version: 20150711200623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "droids", force: :cascade do |t|
    t.string   "name"
    t.text     "appears_in"
    t.string   "primary_function"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "from_character_id"
    t.string   "from_character_type"
    t.integer  "to_character_id"
    t.string   "to_character_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "humen", force: :cascade do |t|
    t.string   "name"
    t.text     "appears_in"
    t.string   "home_planet"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
