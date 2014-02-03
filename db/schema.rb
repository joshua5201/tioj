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

ActiveRecord::Schema.define(version: 20140203101934) do

  create_table "limits", force: true do |t|
    t.integer  "time",       default: 1000
    t.integer  "memory",     default: 65536
    t.integer  "output",     default: 65536
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "input"
    t.text     "output"
    t.text     "example_input"
    t.text     "example_output"
    t.text     "hint"
  end

  create_table "submissions", force: true do |t|
    t.text     "code"
    t.string   "compiler"
    t.string   "result"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testdata", force: true do |t|
    t.text     "input"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
