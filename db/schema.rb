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

ActiveRecord::Schema.define(version: 20160910221118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_batches_on_cohort_id", using: :btree
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cohorts_on_user_id", using: :btree
  end

  create_table "group_students", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_students_on_group_id", using: :btree
    t.index ["student_id"], name: "index_group_students_on_student_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_groups_on_batch_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_students_on_cohort_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "batches", "cohorts"
  add_foreign_key "cohorts", "users"
  add_foreign_key "group_students", "groups"
  add_foreign_key "group_students", "students"
  add_foreign_key "groups", "batches"
  add_foreign_key "students", "cohorts"
end
