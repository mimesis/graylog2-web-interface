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

ActiveRecord::Schema.define(:version => 20110130212941) do

  create_table "alerted_streams", :force => true do |t|
    t.integer  "stream_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blacklisted_terms", :force => true do |t|
    t.string   "term"
    t.integer  "blacklist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blacklists", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", :force => true do |t|
    t.integer  "number"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_streams", :id => false, :force => true do |t|
    t.integer "stream_id"
    t.integer "user_id"
  end

  create_table "filtered_terms", :force => true do |t|
    t.string   "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hostgroup_hosts", :force => true do |t|
    t.integer  "hostgroup_id"
    t.string   "hostname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ruletype"
  end

  create_table "hostgroups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :id => false, :force => true do |t|
    t.string   "title"
    t.integer  "last_run"
    t.datetime "created_at"
  end

  create_table "messagecomments", :force => true do |t|
    t.string   "title"
    t.text     "comment"
    t.string   "match"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "setting_type"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streamrules", :force => true do |t|
    t.integer  "stream_id"
    t.integer  "rule_type"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streams", :force => true do |t|
    t.string   "title"
    t.string   "filter_host"
    t.string   "filter_message"
    t.integer  "filter_severity"
    t.integer  "filter_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_subscription_check"
    t.datetime "last_alarm_check"
    t.boolean  "alarm_active"
    t.boolean  "alarm_force"
    t.integer  "alarm_limit"
    t.integer  "alarm_timespan"
    t.text     "description"
  end

  create_table "streams_users", :id => false, :force => true do |t|
    t.integer "stream_id"
    t.integer "user_id"
  end

  create_table "subscribed_streams", :id => false, :force => true do |t|
    t.integer "stream_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "role"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
