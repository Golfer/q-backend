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

ActiveRecord::Schema.define(version: 2019_01_14_120217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "link_to_wikipedia"
    t.string "short_description"
    t.text "full_description"
    t.date "birthday"
    t.date "date_of_death"
    t.string "pseudonym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_link"
    t.string "link_at_origin_resource"
    t.string "aasm_state"
  end

  create_table "data_quotations", force: :cascade do |t|
    t.string "link_to_external_resource"
    t.string "description"
    t.integer "count_quotates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_runs", force: :cascade do |t|
    t.string "name"
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
  end

  create_table "quotations", force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.bigint "data_quotation_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.index ["author_id"], name: "index_quotations_on_author_id"
    t.index ["data_quotation_id"], name: "index_quotations_on_data_quotation_id"
  end

  create_table "quotations_tags", force: :cascade do |t|
    t.bigint "quotation_id"
    t.bigint "tag_id"
    t.index ["quotation_id"], name: "index_quotations_tags_on_quotation_id"
    t.index ["tag_id"], name: "index_quotations_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "token"
    t.datetime "token_expired_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["full_name"], name: "index_users_on_full_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "quotations_tags", "quotations"
  add_foreign_key "quotations_tags", "tags"
end
