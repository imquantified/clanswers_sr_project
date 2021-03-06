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

ActiveRecord::Schema.define(version: 20140329184325) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "quick_flag"
    t.boolean  "interest_flag"
    t.boolean  "thoughtful_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "quick_flag"
    t.boolean  "interest_flag"
    t.boolean  "thoughtful_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id", "created_at"], name: "index_questions_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
