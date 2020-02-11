# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_11_160252) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.string "college"
    t.integer "age"
    t.string "number"
    t.string "position"
    t.string "height"
    t.string "weight"
    t.integer "startNba"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "conference"
    t.string "division"
    t.string "logo"
  end

end
