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

ActiveRecord::Schema.define(version: 201405222145109) do

  create_table "behaviors", force: true do |t|
    t.string   "name"
    t.string   "icon_url"
    t.string   "icon_code"
    t.integer  "icon_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "behaviors_developers", force: true do |t|
    t.integer "behaviors_id"
    t.integer "developers_id"
  end

  create_table "countries", force: true do |t|
    t.string   "iso"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.text     "why_hack"
    t.boolean  "scholarship"
    t.text     "why_scholarship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",          default: 0
    t.integer  "sponsor_id"
    t.integer  "country_id"
  end

  add_index "developers", ["country_id"], name: "index_developers_on_country_id", using: :btree
  add_index "developers", ["sponsor_id"], name: "index_developers_on_sponsor_id", using: :btree

  create_table "developers_promos", id: false, force: true do |t|
    t.integer "developer_id"
    t.integer "promo_id"
  end

  add_index "developers_promos", ["developer_id"], name: "index_developers_promos_on_developer_id", using: :btree
  add_index "developers_promos", ["promo_id"], name: "index_developers_promos_on_promo_id", using: :btree

  create_table "promos", force: true do |t|
    t.string   "name"
    t.integer  "lapse"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "company_name"
    t.string   "company_email"
    t.string   "company_phone"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  add_index "sponsors", ["country_id"], name: "index_sponsors_on_country_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profileable_id"], name: "index_users_on_profileable_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
