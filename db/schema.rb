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

ActiveRecord::Schema.define(version: 20170513143653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "city",       default: "", null: false
    t.string   "post_index", default: "", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "baners", force: :cascade do |t|
    t.text     "text"
    t.integer  "photo_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "number",     default: 0
    t.string   "name"
    t.index ["photo_id"], name: "index_baners_on_photo_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string  "name",        default: "", null: false
    t.integer "category_id"
    t.integer "pop_id"
    t.string  "polka_url"
    t.text    "about"
    t.index ["category_id"], name: "index_categories_on_category_id", using: :btree
    t.index ["pop_id"], name: "index_categories_on_pop_id", using: :btree
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.index ["category_id"], name: "index_categories_products_on_category_id", using: :btree
    t.index ["product_id"], name: "index_categories_products_on_product_id", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name",             default: "", null: false
    t.integer  "main_color_id"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.index ["main_color_id"], name: "index_colors_on_main_color_id", using: :btree
  end

  create_table "footer_sections", force: :cascade do |t|
    t.integer "order"
    t.text    "text"
    t.boolean "see_all"
    t.boolean "visible"
  end

  create_table "main_colors", force: :cascade do |t|
    t.string "name", default: "",     null: false
    t.string "hex",  default: "#000", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "address"
    t.integer  "user_id"
    t.string   "status",     default: "Ожидает платежа", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "sum",        default: 0.0
    t.float    "cash_back",  default: 0.0
    t.integer  "address_id",                             null: false
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "orders_product_data", force: :cascade do |t|
    t.integer "order_id"
    t.integer "count",            default: 1, null: false
    t.integer "product_size_id"
    t.integer "product_datum_id"
    t.index ["order_id"], name: "index_orders_product_data_on_order_id", using: :btree
    t.index ["product_datum_id"], name: "index_orders_product_data_on_product_datum_id", using: :btree
    t.index ["product_size_id"], name: "index_orders_product_data_on_product_size_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "link"
    t.string   "name"
    t.text     "content"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "photos_product_data", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "product_datum_id"
    t.index ["photo_id"], name: "index_photos_product_data_on_photo_id", using: :btree
    t.index ["product_datum_id"], name: "index_photos_product_data_on_product_datum_id", using: :btree
  end

  create_table "photos_products", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "product_id"
    t.index ["photo_id"], name: "index_photos_products_on_photo_id", using: :btree
    t.index ["product_id"], name: "index_photos_products_on_product_id", using: :btree
  end

  create_table "pops", force: :cascade do |t|
    t.text     "text"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.index ["category_id"], name: "index_pops_on_category_id", using: :btree
  end

  create_table "product_data", force: :cascade do |t|
    t.string   "article",                         null: false
    t.integer  "color_id"
    t.integer  "product_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.float    "price",             default: 0.0, null: false
    t.text     "about",             default: "",  null: false
    t.float    "promotional_price"
    t.string   "more",              default: "",  null: false
    t.index ["color_id"], name: "index_product_data_on_color_id", using: :btree
    t.index ["product_id"], name: "index_product_data_on_product_id", using: :btree
  end

  create_table "product_product_sizes", force: :cascade do |t|
    t.boolean "has",              default: false, null: false
    t.integer "product_datum_id"
    t.integer "product_size_id"
    t.string  "size"
    t.index ["product_datum_id"], name: "index_product_product_sizes_on_product_datum_id", using: :btree
    t.index ["product_size_id"], name: "index_product_product_sizes_on_product_size_id", using: :btree
  end

  create_table "product_sizes", force: :cascade do |t|
    t.integer "category_id"
    t.string  "size",        default: "", null: false
    t.index ["category_id"], name: "index_product_sizes_on_category_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                 default: "", null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "img_alt_file_name"
    t.string   "img_alt_content_type"
    t.integer  "img_alt_file_size"
    t.datetime "img_alt_updated_at"
    t.boolean  "visible"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "first_name"
    t.string   "second_name"
    t.string   "father"
    t.string   "country"
    t.date     "date"
    t.string   "tel"
    t.float    "money",                  default: 0.0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "baners", "photos"
  add_foreign_key "categories_products", "categories"
  add_foreign_key "categories_products", "products"
  add_foreign_key "colors", "main_colors"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_product_data", "orders"
  add_foreign_key "orders_product_data", "product_sizes"
  add_foreign_key "pops", "categories"
  add_foreign_key "product_data", "colors"
  add_foreign_key "product_data", "products"
  add_foreign_key "product_product_sizes", "product_data"
  add_foreign_key "product_product_sizes", "product_sizes"
  add_foreign_key "product_sizes", "categories"
end
