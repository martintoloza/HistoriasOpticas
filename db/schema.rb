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

ActiveRecord::Schema.define(version: 20160121215939) do

  create_table "barrios", force: :cascade do |t|
    t.string  "nombre",    limit: 100
    t.integer "ciudad_id", limit: 4
  end

  add_index "barrios", ["ciudad_id"], name: "index_barrios_on_ciudad_id", using: :btree

  create_table "ciudad_barrios", primary_key: "cityb_id", force: :cascade do |t|
    t.string "codigo", limit: 5
    t.string "nombre", limit: 200
  end

  add_index "ciudad_barrios", ["nombre"], name: "name", type: :fulltext

  create_table "ciudades", force: :cascade do |t|
    t.string  "codigo",          limit: 5
    t.string  "nombre",          limit: 60
    t.integer "departamento_id", limit: 4
  end

  add_index "ciudades", ["codigo"], name: "index_ciudades_on_codigo", unique: true, using: :btree
  add_index "ciudades", ["departamento_id"], name: "index_ciudades_on_departamento_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string "codigo", limit: 2
    t.string "nombre", limit: 60
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "phone",                  limit: 60
    t.integer  "role",                   limit: 2,   default: 2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "barrios", "ciudades"
  add_foreign_key "ciudades", "departamentos"
end
