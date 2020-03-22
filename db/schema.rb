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

ActiveRecord::Schema.define(version: 2020_03_21_114538) do

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gamers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_gamers_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches_teams", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "match_id"
    t.index ["match_id"], name: "index_matches_teams_on_match_id"
    t.index ["team_id", "match_id"], name: "index_matches_teams_on_team_id_and_match_id", unique: true
    t.index ["team_id"], name: "index_matches_teams_on_team_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "feature_id"
    t.integer "gamer_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_tags_on_feature_id"
    t.index ["gamer_id"], name: "index_tags_on_gamer_id"
    t.index ["match_id"], name: "index_tags_on_match_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_teams_on_match_id"
  end

end
