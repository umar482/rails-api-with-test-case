# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_526_143_604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'gears', force: :cascade do |t|
    t.string 'name'
    t.float 'offset_value'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'temperature_readings', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.float 'body_temp'
    t.float 'actual_temp'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_temperature_readings_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.bigint 'gear_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['gear_id'], name: 'index_users_on_gear_id'
  end

  add_foreign_key 'temperature_readings', 'users'
  add_foreign_key 'users', 'gears'
end
