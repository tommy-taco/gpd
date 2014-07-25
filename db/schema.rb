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

ActiveRecord::Schema.define(version: 20140724220236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.string   "player"
    t.integer  "minute"
    t.string   "team"
    t.string   "opponent"
    t.date     "date"
    t.boolean  "penalty"
    t.boolean  "own_goal"
    t.string   "stadium"
    t.boolean  "home"
    t.string   "competition"
    t.string   "stage"
    t.string   "assist"
    t.string   "video"
    t.string   "gfy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["assist"], name: "index_goals_on_assist", using: :btree
  add_index "goals", ["competition"], name: "index_goals_on_competition", using: :btree
  add_index "goals", ["date"], name: "index_goals_on_date", using: :btree
  add_index "goals", ["gfy"], name: "index_goals_on_gfy", using: :btree
  add_index "goals", ["opponent"], name: "index_goals_on_opponent", using: :btree
  add_index "goals", ["own_goal"], name: "index_goals_on_own_goal", using: :btree
  add_index "goals", ["penalty"], name: "index_goals_on_penalty", using: :btree
  add_index "goals", ["player"], name: "index_goals_on_player", using: :btree
  add_index "goals", ["team"], name: "index_goals_on_team", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "national_team"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
