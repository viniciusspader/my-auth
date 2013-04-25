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

ActiveRecord::Schema.define(:version => 20130425112444) do

  create_table "addresses", :force => true do |t|
    t.string   "firstname",  :null => false
    t.string   "lastname",   :null => false
    t.string   "address1",   :null => false
    t.string   "address2"
    t.string   "city",       :null => false
    t.string   "state_id",   :null => false
    t.integer  "country_id", :null => false
    t.string   "zip",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "adjustments", :force => true do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  create_table "countries", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.boolean "active_shipping", :default => false
    t.boolean "active_billing",  :default => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id",                                                              :null => false
    t.integer  "quantity",                                                              :null => false
    t.integer  "sellable_id"
    t.decimal  "price",          :precision => 10, :scale => 2
    t.decimal  "unit_price",     :precision => 10, :scale => 2, :default => 0.0,        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",                                   :default => "",         :null => false
    t.string   "line_item_type",                                :default => "sellable", :null => false
  end

  create_table "order_notes", :force => true do |t|
    t.integer  "order_id",   :null => false
    t.integer  "user_id",    :null => false
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "billing_address_id",                                                                   :null => false
    t.integer  "shipping_address_id",                                                                  :null => false
    t.integer  "user_id"
    t.string   "email",                                                                                :null => false
    t.string   "phone",                                                                                :null => false
    t.decimal  "total",                              :precision => 10, :scale => 2,                    :null => false
    t.decimal  "total_due",                          :precision => 10, :scale => 2,                    :null => false
    t.string   "status",                                                                               :null => false
    t.datetime "created_at",                                                                           :null => false
    t.datetime "updated_at",                                                                           :null => false
    t.string   "ip_address"
    t.text     "user_agent",          :limit => 255
    t.boolean  "to_be_cancelled",                                                   :default => false
  end

  create_table "payment_method_values", :force => true do |t|
    t.integer "payment_method_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "description",                    :null => false
    t.string   "klass",                          :null => false
    t.boolean  "active",      :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "payment_method_id"
    t.string   "status",            :default => "paid", :null => false
    t.integer  "month"
    t.integer  "year"
    t.string   "transaction_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "masked_number"
    t.integer  "line_item_id"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "products", ["id"], :name => "index_products_on_id", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "sellables", :force => true do |t|
    t.string  "sku",                                                                   :null => false
    t.string  "description",                                                           :null => false
    t.decimal "price",               :precision => 10, :scale => 2,                    :null => false
    t.integer "quantity",                                           :default => 0,     :null => false
    t.integer "item_id",                                                               :null => false
    t.string  "item_type",                                                             :null => false
    t.boolean "active",                                             :default => false, :null => false
    t.boolean "unlimited_inventory",                                :default => false, :null => false
  end

  create_table "shipments", :force => true do |t|
    t.integer  "shipping_method_id",                    :null => false
    t.string   "status",             :default => "new", :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "line_item_id"
  end

  create_table "shipping_method_values", :force => true do |t|
    t.integer "shipping_method_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "shipping_methods", :force => true do |t|
    t.string  "description",                    :null => false
    t.string  "klass",                          :null => false
    t.boolean "active",      :default => false, :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.integer "country_id"
  end

  create_table "tax_method_values", :force => true do |t|
    t.integer "tax_method_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "tax_methods", :force => true do |t|
    t.string  "description",                    :null => false
    t.string  "klass",                          :null => false
    t.boolean "active",      :default => false, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
    t.string   "cart_cookie"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
