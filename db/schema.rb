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

ActiveRecord::Schema.define(version: 2019_04_25_153958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "subdomain"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "patronymic"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.date "birthday"
    t.string "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.string "address"
    t.bigint "ogrn"
    t.bigint "inn"
    t.bigint "kpp"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contractors_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "invoice_number"
    t.string "invoice_discription"
    t.integer "user_id"
    t.boolean "is_completed", default: false
    t.bigint "project_id"
    t.integer "cost"
    t.datetime "plan_date_payment"
    t.datetime "rel_date_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contractor_id"
    t.index ["contractor_id"], name: "index_payments_on_contractor_id"
    t.index ["project_id"], name: "index_payments_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "budget", default: 0
    t.integer "cost_per_hour", default: 0
    t.bigint "contractor_id"
    t.index ["contractor_id"], name: "index_projects_on_contractor_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "discription"
    t.integer "user_id"
    t.boolean "isCompleted", default: false
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cost", default: 0
    t.integer "time_to_complete", default: 0
    t.integer "time_spent", default: 0
    t.integer "priority", default: 0
    t.date "deadline"
    t.integer "implementer"
    t.index ["project_id"], name: "index_todos_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "contractors", "users"
  add_foreign_key "payments", "contractors"
  add_foreign_key "payments", "projects"
  add_foreign_key "projects", "contractors"
end
