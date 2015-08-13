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

ActiveRecord::Schema.define(version: 20150629014021) do

  create_table "ermahgerds", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "sprite"
    t.string   "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "evolutions", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "sprite"
    t.integer  "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer  "height"
    t.integer  "weight"
    t.integer  "hp"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "special_attack"
    t.integer  "special_defense"
    t.integer  "speed"
    t.integer  "total"
    t.integer  "pokemon_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.integer  "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
