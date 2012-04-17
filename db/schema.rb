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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120413134857) do

  create_table "downloads", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "file"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "project_id"
    t.integer  "ordinal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "type",       :limit => 50
    t.string   "service_id", :limit => 50
    t.text     "content"
    t.string   "url",        :limit => 100
    t.datetime "posted_at"
    t.boolean  "visible",                   :default => true
  end

  add_index "posts", ["posted_at"], :name => "index_posts_on_posted_at"
  add_index "posts", ["type", "service_id"], :name => "index_posts_on_type_and_service_id", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "who"
    t.string   "where"
    t.string   "what"
    t.date     "when"
    t.text     "equipment_used"
    t.integer  "ordinal",        :default => 999
    t.integer  "window_ordinal", :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "projects", ["ordinal"], :name => "index_projects_on_ordinal"
  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true
  add_index "projects", ["when"], :name => "index_projects_on_when"
  add_index "projects", ["window_ordinal"], :name => "index_projects_on_window_ordinal"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ordinal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "services", ["ordinal"], :name => "index_services_on_ordinal"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "videos", ["project_id"], :name => "index_videos_on_project_id"

end
