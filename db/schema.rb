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

ActiveRecord::Schema.define(version: 2018_12_28_115421) do

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
    t.boolean "publicated", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_link"
    t.string "link_at_origin_resource"
  end

  create_table "data_quotations", force: :cascade do |t|
    t.string "link_to_external_resource"
    t.string "description"
    t.integer "count_quotates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.boolean "publicate", default: false
    t.datetime "publicated_date"
    t.bigint "data_quotation_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "quotations_tags", "quotations"
  add_foreign_key "quotations_tags", "tags"
end
