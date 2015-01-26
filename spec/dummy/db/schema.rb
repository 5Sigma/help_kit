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

ActiveRecord::Schema.define(version: 20150126022104) do

  create_table "help_kit_articles", force: :cascade do |t|
    t.string   "title"
    t.boolean  "published"
    t.text     "content"
    t.datetime "published_at"
    t.integer  "view_count"
    t.integer  "creator_id"
    t.integer  "last_editor_id"
    t.integer  "category_id"
    t.integer  "parent_article_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "help_kit_articles", ["category_id"], name: "index_help_kit_articles_on_category_id"
  add_index "help_kit_articles", ["creator_id"], name: "index_help_kit_articles_on_creator_id"
  add_index "help_kit_articles", ["last_editor_id"], name: "index_help_kit_articles_on_last_editor_id"
  add_index "help_kit_articles", ["parent_article_id"], name: "index_help_kit_articles_on_parent_article_id"

  create_table "help_kit_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "help_kit_categories", ["parent_id"], name: "index_help_kit_categories_on_parent_id"

end
