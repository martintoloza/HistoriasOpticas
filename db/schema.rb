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

ActiveRecord::Schema.define(version: 20151125021841) do

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

  add_foreign_key "ciudades", "departamentos"
end
