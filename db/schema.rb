# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100207214639) do

  create_table "publications", :force => true do |t|
    t.text     "citation",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["citation"], :name => "index_publications_on_citation"

  create_table "references", :force => true do |t|
    t.integer  "sample_id",      :null => false
    t.integer  "publication_id", :null => false
    t.string   "page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "references", ["publication_id"], :name => "index_references_on_publication_id"
  add_index "references", ["sample_id"], :name => "index_references_on_sample_id"

  create_table "samples", :force => true do |t|
    t.integer  "site_id",            :null => false
    t.text     "description"
    t.integer  "radiocarbon_age_bp"
    t.integer  "std_dev"
    t.integer  "lower_cal_date"
    t.integer  "upper_cal_date"
    t.integer  "median_cal_date"
    t.string   "lab_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "samples", ["lab_number"], :name => "index_samples_on_lab_number"
  add_index "samples", ["lower_cal_date"], :name => "index_samples_on_lower_cal_date"
  add_index "samples", ["median_cal_date"], :name => "index_samples_on_median_cal_date"
  add_index "samples", ["radiocarbon_age_bp"], :name => "index_samples_on_radiocarbon_age_bp"
  add_index "samples", ["site_id"], :name => "index_samples_on_site_id"
  add_index "samples", ["upper_cal_date"], :name => "index_samples_on_upper_cal_date"

  create_table "sites", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "location_name"
    t.float    "lat",           :null => false
    t.float    "lng",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["lat"], :name => "index_sites_on_lat"
  add_index "sites", ["lng"], :name => "index_sites_on_lng"
  add_index "sites", ["location_name"], :name => "index_sites_on_location_name"
  add_index "sites", ["name"], :name => "index_sites_on_name"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
