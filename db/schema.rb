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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120127222645) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret"
    t.string   "token"
  end

  create_table "games", :force => true do |t|
    t.integer  "fgs",           :default => 0
    t.integer  "threepointers", :default => 0
    t.integer  "rebs",          :default => 0
    t.integer  "assists",       :default => 0
    t.integer  "blocks",        :default => 0
    t.integer  "steals",        :default => 0
    t.integer  "turnovers",     :default => 0
    t.string   "player_name"
    t.date     "date"
    t.string   "opponent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "league_memberships", :force => true do |t|
    t.integer  "team_id"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_ownerships", :force => true do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "nba_team"
    t.string   "position"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
    t.integer  "fgs_sum",           :default => 0
    t.integer  "threepointers_sum", :default => 0
    t.integer  "rebs_sum",          :default => 0
    t.integer  "assists_sum",       :default => 0
    t.integer  "blocks_sum",        :default => 0
    t.integer  "steals_sum",        :default => 0
    t.integer  "turnovers_sum",     :default => 0
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "wins",                 :default => 0
    t.integer  "losses",               :default => 0
    t.boolean  "complete"
    t.float    "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "budget",               :default => 1000
    t.float    "fantasy_points",       :default => 0.0
    t.float    "fantasy_points_total", :default => 0.0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
