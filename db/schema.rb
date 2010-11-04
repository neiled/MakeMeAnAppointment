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

ActiveRecord::Schema.define(:version => 20101104193050) do

  create_table "appointment_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       :precision => 19, :scale => 4
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
  end

  create_table "bookables", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calendar_id"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.text     "address"
    t.string   "phone_main"
    t.string   "phone_other"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "calendar_id"
  end

  create_table "calendars", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holiday_dates", :force => true do |t|
    t.integer  "calendar_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "end_date"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_id"
  end

  create_table "work_days", :force => true do |t|
    t.integer  "calendar_id"
    t.integer  "day"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
