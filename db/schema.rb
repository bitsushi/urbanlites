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

ActiveRecord::Schema.define(:version => 20120427100845) do

  create_table "downloads", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "file"
    t.integer  "ordinal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "downloads", ["ordinal"], :name => "index_downloads_on_ordinal"

  create_table "ethoses", :force => true do |t|
    t.string   "headline"
    t.text     "description"
    t.integer  "ordinal"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ethoses", ["ordinal"], :name => "index_ethoses_on_ordinal"

  create_table "facebook_posts", :force => true do |t|
    t.string   "uid"
    t.string   "url"
    t.datetime "posted_at"
    t.text     "content"
  end

  add_index "facebook_posts", ["posted_at"], :name => "index_facebook_posts_on_posted_at"
  add_index "facebook_posts", ["uid"], :name => "index_facebook_posts_on_uid", :unique => true

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "project_id"
    t.integer  "ordinal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "who"
    t.string   "where"
    t.date     "when"
    t.string   "what"
    t.text     "description"
    t.integer  "ordinal"
    t.integer  "window_ordinal", :default => 0
    t.integer  "photos_count"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "projects", ["ordinal"], :name => "index_projects_on_ordinal"
  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true
  add_index "projects", ["when"], :name => "index_projects_on_when"
  add_index "projects", ["window_ordinal"], :name => "index_projects_on_window_ordinal"

  create_table "quotes", :force => true do |t|
    t.integer  "project_id"
    t.text     "body"
    t.string   "author"
    t.string   "position"
    t.string   "organisation"
    t.integer  "ordinal"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "quotes", ["ordinal"], :name => "index_quotes_on_ordinal"
  add_index "quotes", ["project_id"], :name => "index_quotes_on_project_id"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ordinal"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "services", ["ordinal"], :name => "index_services_on_ordinal"

  create_table "tweets", :force => true do |t|
    t.string   "body"
    t.string   "media"
    t.string   "uid",       :limit => 40
    t.string   "url"
    t.datetime "posted_at"
  end

  add_index "tweets", ["posted_at"], :name => "index_tweets_on_posted_at"
  add_index "tweets", ["uid"], :name => "index_tweets_on_uid", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "uid"
    t.integer  "project_id"
    t.text     "description"
    t.integer  "duration"
    t.datetime "published_at"
    t.string   "state"
    t.integer  "width"
    t.integer  "height"
  end

  add_index "videos", ["project_id"], :name => "index_videos_on_project_id"
  add_index "videos", ["published_at"], :name => "index_videos_on_published_at"
  add_index "videos", ["uid"], :name => "index_videos_on_uid", :unique => true

end
