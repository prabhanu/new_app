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

ActiveRecord::Schema.define(:version => 20130928141652) do

  create_table "acl_access_controls", :force => true do |t|
    t.string   "group"
    t.string   "resource"
    t.string   "permission"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "acl_group_roles", :force => true do |t|
    t.string   "name"
    t.integer  "acl_role_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "acl_groups", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "acl_permissions", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "resource_id"
  end

  add_index "acl_permissions", ["role_id", "resource_id"], :name => "index_acl_permissions_on_role_id_and_resource_id"

  create_table "acl_resources", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "acl_resources", ["name", "parent_id"], :name => "index_acl_resources_on_name_and_parent_id"

  create_table "acl_roles", :force => true do |t|
    t.string   "name"
    t.string   "role_type"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "acl_roles_users", :force => true do |t|
    t.integer  "acl_role_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "role_id"
  end

  create_table "ad_methods_developers", :force => true do |t|
    t.integer "ad_method_id"
    t.integer "developer_id"
  end

  create_table "advertising_media", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "airports", :force => true do |t|
    t.string   "name",                                                 :null => false
    t.string   "label_name",                                           :null => false
    t.integer  "city_id",                                              :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
  end

  add_index "airports", ["city_id"], :name => "index_airports_on_city_id"
  add_index "airports", ["coordinates"], :name => "index_airports_on_coordinates", :spatial => true

  create_table "apartment_types", :force => true do |t|
    t.string   "name",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "priority"
    t.integer  "mapped_id"
    t.string   "display_name"
  end

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "status"
    t.text     "api_public_key"
    t.text     "api_private_key"
    t.integer  "query_limit_per_day"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "broker_languages", :force => true do |t|
    t.integer "broker_id",     :null => false
    t.integer "language_id",   :null => false
    t.string  "language_type", :null => false
  end

  add_index "broker_languages", ["broker_id", "language_id", "language_type"], :name => "brokerl_index"

  create_table "broker_locality_services", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "service_id"
    t.integer  "locality_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "broker_locality_services", ["broker_id", "service_id", "locality_id"], :name => "broker_locality_service_triplet", :unique => true
  add_index "broker_locality_services", ["broker_id"], :name => "index_broker_locality_services_on_broker_id"
  add_index "broker_locality_services", ["locality_id"], :name => "index_broker_locality_services_on_locality_id"
  add_index "broker_locality_services", ["service_id"], :name => "index_broker_locality_services_on_service_id"

  create_table "broker_services", :force => true do |t|
    t.integer "service_id"
    t.integer "broker_id"
  end

  add_index "broker_services", ["broker_id", "service_id"], :name => "index_broker_services_on_broker_id_and_service_id"

  create_table "broker_societies", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "society_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "broker_societies", ["broker_id", "society_id"], :name => "broker_society_pair", :unique => true
  add_index "broker_societies", ["broker_id"], :name => "index_broker_societies_on_broker_id"
  add_index "broker_societies", ["society_id"], :name => "index_broker_societies_on_society_id"

  create_table "broker_subscribed_competitors", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "competitor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "broker_subscribed_competitors", ["broker_id", "competitor_id"], :name => "br_subscribed_competitor"
  add_index "broker_subscribed_competitors", ["broker_id"], :name => "index_broker_subscribed_competitors_on_broker_id"
  add_index "broker_subscribed_competitors", ["competitor_id"], :name => "index_broker_subscribed_competitors_on_competitor_id"

  create_table "brokers", :force => true do |t|
    t.string   "name",                                                            :null => false
    t.string   "nick_name"
    t.string   "email_id"
    t.integer  "age"
    t.string   "sex"
    t.string   "education"
    t.string   "smartphone"
    t.boolean  "married"
    t.string   "fav_movie_star"
    t.string   "hobbies"
    t.string   "firm_name"
    t.string   "firm_tagline"
    t.integer  "firm_legal_status_id",                                            :null => false
    t.string   "address",                                                         :null => false
    t.integer  "locality_id",                                                     :null => false
    t.string   "firm_email_id"
    t.string   "website"
    t.text     "brokerage_charges"
    t.integer  "shop_area"
    t.integer  "num_computers"
    t.boolean  "has_internet"
    t.integer  "broker_staff_count"
    t.integer  "non_broker_staff_count"
    t.string   "working_days"
    t.string   "working_hours"
    t.integer  "rent_houses_count"
    t.integer  "pg_houses_count"
    t.integer  "magazine_language_id",                                            :null => false
    t.boolean  "sms_alert",                                                       :null => false
    t.boolean  "email_alert",                                                     :null => false
    t.date     "in_business_since"
    t.boolean  "has_service_vehicle"
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.spatial  "coordinates",            :limit => {:srid=>4326, :type=>"point"}
    t.integer  "images_count"
    t.integer  "rent_bhi"
    t.integer  "buy_bhi"
  end

  create_table "builders", :force => true do |t|
    t.integer  "in_business_since"
    t.integer  "number_of_projects"
    t.integer  "average_project_size"
    t.integer  "marketing_budget"
    t.integer  "deals_in_id"
    t.string   "firm_email"
    t.string   "primary_phone_number"
    t.string   "secondary_phone_number"
    t.string   "sms_phone_number"
    t.string   "firm_name"
    t.integer  "firm_logo_id"
    t.integer  "firm_legal_status_id"
    t.string   "firm_tagline"
    t.string   "website"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "builders", ["deals_in_id"], :name => "index_builders_on_deals_in_id"
  add_index "builders", ["firm_legal_status_id"], :name => "index_builders_on_firm_legal_status_id"
  add_index "builders", ["firm_logo_id"], :name => "index_builders_on_firm_logo_id"

  create_table "builders_addresses", :force => true do |t|
    t.string   "building_number"
    t.string   "building_name"
    t.string   "street"
    t.string   "pincode"
    t.integer  "locality_id"
    t.integer  "builder_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "builders_addresses", ["builder_id"], :name => "index_builders_addresses_on_builder_id"
  add_index "builders_addresses", ["locality_id"], :name => "index_builders_addresses_on_locality_id"

  create_table "builders_advertising_media", :force => true do |t|
    t.integer  "builder_id"
    t.integer  "advertising_medium_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "builders_advertising_media", ["advertising_medium_id"], :name => "index_builders_advertising_media_on_advertising_medium_id"
  add_index "builders_advertising_media", ["builder_id"], :name => "index_builders_advertising_media_on_builder_id"

  create_table "builders_agents", :force => true do |t|
    t.string   "name"
    t.string   "nick_name"
    t.string   "email"
    t.string   "primary_phone_number"
    t.string   "secondary_phone_number"
    t.string   "sms_phone_number"
    t.integer  "builder_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "builders_agents", ["builder_id"], :name => "index_builders_agents_on_builder_id"

  create_table "builders_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "builders_cities", :force => true do |t|
    t.integer  "city_id"
    t.integer  "builder_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "builders_cities", ["builder_id"], :name => "index_builders_cities_on_builder_id"
  add_index "builders_cities", ["city_id"], :name => "index_builders_cities_on_city_id"

  create_table "builders_competitor_subscriptions", :force => true do |t|
    t.integer  "competitor_id"
    t.integer  "builder_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "builders_competitor_subscriptions", ["builder_id"], :name => "index_builders_competitor_subscriptions_on_builder_id"
  add_index "builders_competitor_subscriptions", ["competitor_id"], :name => "index_builders_competitor_subscriptions_on_competitor_id"

  create_table "builders_deals_ins", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "builders_photos", :force => true do |t|
    t.string   "caption"
    t.string   "name"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "business_verticals_developers", :force => true do |t|
    t.integer "business_vertical_id"
    t.integer "developer_id"
  end

  create_table "buy_contact_request_sms_logs", :id => false, :force => true do |t|
    t.integer "buy_contact_request_id"
    t.integer "sms_log_id"
  end

  create_table "buy_contact_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "flat_id"
    t.string   "comments"
    t.integer  "status"
    t.datetime "callback"
    t.string   "notes"
    t.string   "admin_notes"
    t.text     "ip_address"
    t.text     "session_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "sms_status_id"
    t.integer  "city_id"
    t.datetime "sms_send_after"
  end

  add_index "buy_contact_requests", ["city_id"], :name => "index_buy_contact_requests_on_city_id"

  create_table "buy_flat_bedrooms", :force => true do |t|
    t.boolean  "has_attached_balcony"
    t.boolean  "has_attached_bathroom"
    t.integer  "buy_flat_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "buy_flat_bedrooms", ["buy_flat_id"], :name => "index_buy_flat_bedrooms_on_buy_flat_id"

  create_table "buy_flat_images", :force => true do |t|
    t.integer  "buy_flat_id"
    t.integer  "image_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "buy_flat_images", ["buy_flat_id"], :name => "index_buy_flat_images_on_buy_flat_id"
  add_index "buy_flat_images", ["image_id"], :name => "index_buy_flat_images_on_image_id"

  create_table "buy_flat_lifestyle_fields", :force => true do |t|
    t.string   "restaurant_type"
    t.string   "kids_type"
    t.string   "night_life_type"
    t.string   "hospital_type"
    t.string   "shopping_type"
    t.string   "family_type"
    t.string   "road_connectivity"
    t.string   "bus_connectivity"
    t.string   "train_connectivity"
    t.string   "locality_type"
    t.string   "society_type"
    t.integer  "lifestyle_rating"
    t.integer  "connectivity_score"
    t.integer  "peripheral_score"
    t.integer  "location_score"
    t.integer  "buy_flat_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "lifestyle_rating_type"
    t.decimal  "new_lifestyle_rating",  :precision => 3, :scale => 1
  end

  create_table "buy_flats", :force => true do |t|
    t.integer  "property_type_id",                                                      :null => false
    t.integer  "floor_number",                 :limit => 2,                             :null => false
    t.string   "flat_number",                                                           :null => false
    t.string   "building_name",                                                         :null => false
    t.string   "street_info",                                                           :null => false
    t.integer  "locality_id",                                                           :null => false
    t.integer  "apartment_type_id",                                                     :null => false
    t.integer  "built_up_area"
    t.string   "carpet_area"
    t.integer  "price",                                                                 :null => false
    t.integer  "per_square_feet_rate",                                                  :null => false
    t.boolean  "is_price_negotiable",                                                   :null => false
    t.integer  "bedroom_count",                :limit => 2,                             :null => false
    t.integer  "bathroom_count",               :limit => 2,                             :null => false
    t.boolean  "has_swimming_pool",                                                     :null => false
    t.boolean  "has_gym",                                                               :null => false
    t.boolean  "has_lift",                                                              :null => false
    t.integer  "age_of_property"
    t.integer  "floor_count"
    t.integer  "number_of_lifts",              :limit => 2
    t.text     "nearby_landmarks"
    t.text     "comments"
    t.integer  "status_id"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.spatial  "coordinates",                  :limit => {:srid=>0, :type=>"point"}
    t.integer  "data_collector_id"
    t.string   "formatted_price"
    t.integer  "parking_count"
    t.boolean  "has_gas_pipeline"
    t.date     "available_from"
    t.integer  "power_backup_type_id"
    t.boolean  "has_servant_room"
    t.integer  "security_type_id"
    t.boolean  "is_gated_community"
    t.integer  "water_supply_type_id"
    t.text     "canonical_url"
    t.text     "description"
    t.spatial  "center_point",                 :limit => {:srid=>4326, :type=>"point"}
    t.text     "og_tags"
    t.string   "title"
    t.boolean  "is_society_formed"
    t.boolean  "are_photographs_satisfactory"
    t.boolean  "is_data_accurate"
    t.boolean  "is_data_entry_satisfactory"
    t.string   "main_entrance_facing"
    t.integer  "floor_height"
    t.boolean  "has_garden"
    t.date     "sold_on_date"
    t.boolean  "is_floor_plan_satisfactory"
    t.integer  "images_count"
    t.integer  "freshness_index"
  end

  add_index "buy_flats", ["apartment_type_id"], :name => "index_buy_flats_on_apartment_type_id"
  add_index "buy_flats", ["data_collector_id"], :name => "index_buy_flats_on_data_collector_id"
  add_index "buy_flats", ["has_servant_room"], :name => "index_buy_flats_on_has_servant_room"
  add_index "buy_flats", ["is_gated_community"], :name => "index_buy_flats_on_is_gated_community"
  add_index "buy_flats", ["locality_id"], :name => "index_buy_flats_on_locality_id"
  add_index "buy_flats", ["power_backup_type_id"], :name => "index_buy_flats_on_power_backup_type_id"
  add_index "buy_flats", ["property_type_id"], :name => "index_buy_flats_on_property_type_id"
  add_index "buy_flats", ["security_type_id"], :name => "index_buy_flats_on_security_type_id"
  add_index "buy_flats", ["status_id"], :name => "index_buy_flats_on_status_id"
  add_index "buy_flats", ["water_supply_type_id"], :name => "index_buy_flats_on_water_supply_type_id"

  create_table "buy_listing_request_flats", :force => true do |t|
    t.integer  "buy_flat_id"
    t.integer  "listing_request_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "buy_listing_request_flats", ["buy_flat_id"], :name => "index_buy_listing_request_flats_on_buy_flat_id"
  add_index "buy_listing_request_flats", ["listing_request_id"], :name => "index_buy_listing_request_flats_on_listing_request_id"

  create_table "buy_listing_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.integer  "status"
    t.datetime "callback"
    t.text     "notes"
    t.text     "admin_notes"
    t.string   "key_handler_name"
    t.string   "key_handler_phone_num"
    t.datetime "collection_time"
    t.datetime "visit_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "data_collector_id"
    t.integer  "data_uploader_id"
    t.integer  "city_id"
    t.text     "meeting_address"
    t.boolean  "is_landlord_request"
    t.integer  "user_id"
  end

  create_table "buy_need_flat_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "localities"
    t.string   "apartment_types"
    t.string   "rent_range"
    t.string   "furnish_types"
    t.text     "comments"
    t.integer  "status"
    t.datetime "callback"
    t.text     "notes"
    t.string   "admin_notes"
    t.text     "ip_address"
    t.text     "session_id"
    t.integer  "broker_assigned"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "city_id"
  end

  add_index "buy_need_flat_requests", ["city_id"], :name => "index_buy_need_flat_requests_on_city_id"

  create_table "buy_need_flat_requests_brokers", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "need_flat_request_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "buy_need_flat_requests_notifications", :force => true do |t|
    t.integer  "buy_need_flat_request_id",                    :null => false
    t.string   "context",                                     :null => false
    t.string   "target",                                      :null => false
    t.string   "task",                                        :null => false
    t.boolean  "background",                                  :null => false
    t.text     "message"
    t.text     "extra_data"
    t.datetime "send_after"
    t.datetime "sent_at"
    t.integer  "retry_of"
    t.integer  "status_id"
    t.boolean  "retried",                  :default => false
    t.boolean  "ignored",                  :default => true
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "buy_need_flat_requests_notifications", ["send_after"], :name => "index_buy_need_flat_requests_notifications_on_send_after"
  add_index "buy_need_flat_requests_notifications", ["status_id"], :name => "index_buy_need_flat_requests_notifications_on_status_id"

  create_table "buy_need_flat_requests_sms_logs", :force => true do |t|
    t.integer  "sms_log_id"
    t.integer  "buy_need_flat_requests_notification_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "buy_need_flat_requests_sms_logs", ["buy_need_flat_requests_notification_id"], :name => "bnf_sms_log_bnf_nid"
  add_index "buy_need_flat_requests_sms_logs", ["sms_log_id"], :name => "index_buy_need_flat_requests_sms_logs_on_sms_log_id"

  create_table "change_types", :force => true do |t|
    t.string   "name"
    t.integer  "log_listing_request_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
    t.spatial  "bounds_ne",   :limit => {:srid=>4326, :type=>"point"}
    t.spatial  "bounds_sw",   :limit => {:srid=>4326, :type=>"point"}
    t.integer  "status_id"
    t.integer  "priority"
    t.string   "url_name"
    t.text     "description"
  end

  add_index "cities", ["coordinates"], :name => "index_cities_on_coordinates", :spatial => true
  add_index "cities", ["priority"], :name => "index_cities_on_priority"
  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"
  add_index "cities", ["status_id"], :name => "index_cities_on_status_id"

  create_table "cities_developers", :force => true do |t|
    t.integer "city_id"
    t.integer "developer_id"
  end

  create_table "cities_services_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "city_services", :force => true do |t|
    t.integer  "city_id"
    t.integer  "service_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status_id"
  end

  add_index "city_services", ["city_id"], :name => "index_city_services_on_city_id"
  add_index "city_services", ["service_id"], :name => "index_city_services_on_service_id"

  create_table "coming_soon_user_details", :force => true do |t|
    t.string   "email"
    t.integer  "city_id"
    t.integer  "service_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "competitors", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "competitors_developers", :force => true do |t|
    t.integer "competitor_id"
    t.integer "developer_id"
  end

  create_table "contact_request_sms_logs", :id => false, :force => true do |t|
    t.integer "contact_request_id"
    t.integer "sms_log_id"
  end

  create_table "contact_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "flat_id"
    t.integer  "status"
    t.datetime "callback"
    t.text     "notes"
    t.text     "admin_notes"
    t.text     "ip_address"
    t.text     "session_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "sms_send_after"
    t.integer  "sms_status_id"
    t.integer  "city_id"
  end

  add_index "contact_requests", ["city_id"], :name => "index_contact_requests_on_city_id"

  create_table "countries", :force => true do |t|
    t.string   "name",                                                 :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
  end

  add_index "countries", ["coordinates"], :name => "index_countries_on_coordinates", :spatial => true

  create_table "crops_lands", :force => true do |t|
    t.integer "land_id"
    t.integer "crop_id"
  end

  create_table "data_uploaders", :force => true do |t|
    t.integer  "property_id"
    t.string   "classified_website"
    t.string   "classified_url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "dummies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone_num"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dummies_users", :id => false, :force => true do |t|
    t.integer "dummy_id"
    t.integer "user_id"
  end

  add_index "dummies_users", ["dummy_id", "user_id"], :name => "index_dummies_users_on_dummy_id_and_user_id"

  create_table "employees_data_collectors", :force => true do |t|
    t.string   "name"
    t.string   "phone_no"
    t.integer  "city_id"
    t.integer  "shift_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees_data_collectors_shifts", :force => true do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "firm_legal_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flat_image_hashes", :force => true do |t|
    t.integer  "flat_id"
    t.string   "imagehash"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flat_old_id_maps", :force => true do |t|
    t.integer  "flat_id"
    t.integer  "old_flat_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "flat_seen_bies", :force => true do |t|
    t.integer  "flat_id"
    t.integer  "num_visitors"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "floorings", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "furnish_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "housing_offices", :force => true do |t|
    t.string   "name",                                                  :null => false
    t.integer  "city_id",                                               :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.spatial  "coordinates",  :limit => {:srid=>4326, :type=>"point"}
    t.text     "address"
    t.string   "phone_number"
  end

  add_index "housing_offices", ["city_id"], :name => "index_housing_offices_on_city_id"
  add_index "housing_offices", ["coordinates"], :name => "index_housing_offices_on_coordinates", :spatial => true

  create_table "image_categories", :force => true do |t|
    t.string   "name",           :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "object_type_id"
  end

  create_table "images", :force => true do |t|
    t.integer  "priority",          :limit => 2, :default => 0
    t.string   "image"
    t.string   "caption"
    t.integer  "image_category_id"
    t.integer  "object_id"
    t.string   "object_type"
    t.datetime "created_at"
  end

  add_index "images", ["image_category_id"], :name => "index_images_on_image_category_id"
  add_index "images", ["object_id", "object_type"], :name => "index_images_on_object_id_and_object_type"
  add_index "images", ["object_id", "priority"], :name => "index_images_on_object_id_and_priority"
  add_index "images", ["object_id"], :name => "index_images_on_object_id"
  add_index "images", ["object_type"], :name => "index_images_on_object_type"
  add_index "images", ["priority"], :name => "index_images_on_priority"

  create_table "land_ad_methods", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "land_boundary_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_broker_images", :force => true do |t|
    t.string   "name"
    t.integer  "broker_id"
    t.boolean  "is_processed", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "land_broker_logos", :force => true do |t|
    t.string   "name"
    t.integer  "broker_id"
    t.boolean  "is_processed", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "land_brokers", :force => true do |t|
    t.string   "name"
    t.string   "email_id"
    t.integer  "age"
    t.string   "sex"
    t.string   "firm_name"
    t.string   "firm_tagline"
    t.integer  "firm_legal_status_id"
    t.string   "address"
    t.integer  "state_id"
    t.string   "firm_email_id"
    t.string   "website"
    t.text     "brokerage_charges"
    t.string   "working_days"
    t.string   "working_hours"
    t.boolean  "sms_alert"
    t.boolean  "email_alert"
    t.date     "in_business_since"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "land_business_verticals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_contact_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "land_id"
    t.integer  "status_id"
    t.string   "ip_address"
    t.string   "session_id"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_contact_requests_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_crops", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_developer_contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "developer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "land_developer_logos", :force => true do |t|
    t.string   "name"
    t.integer  "developer_id"
    t.boolean  "is_processed", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "land_developers", :force => true do |t|
    t.string   "name"
    t.string   "firm_name"
    t.string   "firm_tagline"
    t.integer  "firm_legal_status_id"
    t.string   "address"
    t.integer  "state_id"
    t.string   "firm_email_id"
    t.string   "website"
    t.date     "in_business_since"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "registered_address"
    t.integer  "no_of_projects"
    t.string   "builder_group_name"
    t.float    "avg_project_size"
    t.float    "marketing_budget"
  end

  create_table "land_electricity_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_elevation_from_roads", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_land_images", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "is_processed", :default => false
    t.integer  "land_id"
  end

  create_table "land_land_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_lands", :force => true do |t|
    t.integer  "purpose_of_listing_id"
    t.integer  "data_collector_id"
    t.string   "S_NO"
    t.string   "title"
    t.integer  "village_id"
    t.integer  "locality_id"
    t.date     "date"
    t.integer  "sales_executive_id"
    t.integer  "owner_id"
    t.boolean  "display_name"
    t.boolean  "display_phone_no"
    t.string   "other_contact_name"
    t.string   "other_contact_phone_no"
    t.string   "landmark"
    t.string   "street"
    t.integer  "land_type_id"
    t.integer  "present_use_id"
    t.boolean  "land_papers"
    t.text     "why_no_land_paper"
    t.float    "area"
    t.integer  "unit_id"
    t.float    "price_per_unit"
    t.boolean  "is_price_negotiable"
    t.float    "security_deposit"
    t.integer  "boundary_type_id"
    t.text     "other_boundary_type"
    t.boolean  "drainage"
    t.integer  "electricity_type_id"
    t.integer  "restriction_on_buy_id"
    t.text     "other_restrictions"
    t.boolean  "internet"
    t.boolean  "gated"
    t.boolean  "telephone"
    t.integer  "elevation_from_road_id"
    t.text     "comments"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.spatial  "coordinates",              :limit => {:srid=>0, :type=>"point"}
    t.float    "price"
    t.integer  "status_id"
    t.text     "canonical_url"
    t.string   "formatted_price"
    t.date     "sold_on_date"
    t.text     "boundary_polygon"
    t.string   "formatted_price_per_unit"
    t.spatial  "non_encoded_polygon",      :limit => {:srid=>3785, :type=>"polygon"}
    t.string   "swf_file_key"
    t.string   "xml_file_key"
    t.string   "thumb_key"
    t.string   "preview_key"
  end

  add_index "land_lands", ["area"], :name => "index_land_lands_on_area"
  add_index "land_lands", ["boundary_type_id"], :name => "index_land_lands_on_boundary_type_id"
  add_index "land_lands", ["coordinates"], :name => "index_land_lands_on_coordinates", :spatial => true
  add_index "land_lands", ["date"], :name => "index_land_lands_on_date"
  add_index "land_lands", ["drainage"], :name => "index_land_lands_on_drainage"
  add_index "land_lands", ["electricity_type_id"], :name => "index_land_lands_on_electricity_type_id"
  add_index "land_lands", ["formatted_price"], :name => "index_land_lands_on_formatted_price"
  add_index "land_lands", ["land_type_id"], :name => "index_land_lands_on_land_type_id"
  add_index "land_lands", ["locality_id"], :name => "index_land_lands_on_locality_id"
  add_index "land_lands", ["owner_id"], :name => "index_land_lands_on_owner_id"
  add_index "land_lands", ["present_use_id"], :name => "index_land_lands_on_present_use_id"
  add_index "land_lands", ["price"], :name => "index_land_lands_on_price"
  add_index "land_lands", ["price_per_unit"], :name => "index_land_lands_on_price_per_unit"
  add_index "land_lands", ["purpose_of_listing_id"], :name => "index_land_lands_on_purpose_of_listing_id"
  add_index "land_lands", ["restriction_on_buy_id"], :name => "index_land_lands_on_restriction_on_buy_id"
  add_index "land_lands", ["status_id"], :name => "index_land_lands_on_status_id"
  add_index "land_lands", ["village_id"], :name => "index_land_lands_on_village_id"

  create_table "land_lands_roads", :force => true do |t|
    t.integer  "land_id"
    t.integer  "road_id"
    t.integer  "front_length"
    t.integer  "unit_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "land_lands_roads", ["land_id"], :name => "index_land_lands_roads_on_land_id"
  add_index "land_lands_roads", ["road_id"], :name => "index_land_lands_roads_on_road_id"

  create_table "land_listing_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_owner_images", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.boolean  "is_processed", :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "land_owners", :force => true do |t|
    t.string   "name"
    t.string   "email_id"
    t.integer  "age"
    t.string   "sex"
    t.string   "address"
    t.boolean  "sms_alert"
    t.boolean  "email_alert"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "state_id"
  end

  create_table "land_points", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.spatial  "coordinates", :limit => {:srid=>0, :type=>"point"}
    t.integer  "land_id"
    t.float    "altitude"
  end

  create_table "land_purpose_of_listings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_requirements", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "requirement"
    t.integer  "city_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "land_restriction_on_buys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_road_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_roads", :force => true do |t|
    t.string   "name"
    t.integer  "no_of_lanes"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "road_type_id"
  end

  add_index "land_roads", ["no_of_lanes"], :name => "index_land_roads_on_no_of_lanes"
  add_index "land_roads", ["road_type_id"], :name => "index_land_roads_on_road_type_id"

  create_table "land_structures", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "unit_type"
    t.float    "value"
  end

  create_table "land_water_availability_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_water_body_attacheds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "land_wikis", :force => true do |t|
    t.text     "page"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.integer  "village_id"
  end

  create_table "lands_structures", :force => true do |t|
    t.integer "land_id"
    t.integer "structure_id"
  end

  create_table "lands_water_availability_types", :force => true do |t|
    t.integer "land_id"
    t.integer "water_availability_type_id"
  end

  add_index "lands_water_availability_types", ["land_id"], :name => "land_index_for_lands_water_av_types"
  add_index "lands_water_availability_types", ["water_availability_type_id"], :name => "wvt_index_for_lands_water_av_types"

  create_table "lands_water_body_attacheds", :force => true do |t|
    t.integer "land_id"
    t.integer "water_body_attached_id"
  end

  add_index "lands_water_body_attacheds", ["land_id"], :name => "land_index_for_lands_wba"
  add_index "lands_water_body_attacheds", ["water_body_attached_id"], :name => "wba_index_for_lands_wba"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.boolean  "is_magazine_available", :default => false
  end

  create_table "lease_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_request_buy_flats", :force => true do |t|
    t.integer  "buy_flat_id"
    t.integer  "listing_request_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "listing_request_reason_for_deletions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_request_reason_for_visit_cancellations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_request_rejected_data", :force => true do |t|
    t.text     "address"
    t.integer  "type_id"
    t.integer  "reason_id"
    t.integer  "listing_request_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "listing_request_rejected_data", ["reason_id"], :name => "index_listing_request_rejected_data_on_reason_id"
  add_index "listing_request_rejected_data", ["type_id"], :name => "index_listing_request_rejected_data_on_type_id"

  create_table "listing_request_rejected_data_reasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_request_rejected_data_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_request_rent_flats", :force => true do |t|
    t.integer  "rent_flat_id"
    t.integer  "listing_request_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "listing_request_rent_flats", ["listing_request_id"], :name => "index_rent_listing_request_flats_on_listing_request_id"
  add_index "listing_request_rent_flats", ["rent_flat_id"], :name => "index_rent_listing_request_flats_on_rent_flat_id"

  create_table "listing_request_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.integer  "status_id"
    t.datetime "callback"
    t.text     "notes"
    t.datetime "created_at",                                                                :null => false
    t.datetime "updated_at",                                                                :null => false
    t.string   "key_handler_name"
    t.string   "key_handler_phone_num"
    t.datetime "actual_visit_time"
    t.datetime "visit_start_time"
    t.integer  "data_collector_id"
    t.integer  "data_uploader_id"
    t.integer  "city_id"
    t.text     "meeting_address"
    t.boolean  "is_landlord_request"
    t.integer  "user_id"
    t.datetime "visit_end_time"
    t.integer  "expected_flat_count"
    t.integer  "rent_flat_count"
    t.integer  "buy_flat_count"
    t.integer  "common_flat_count"
    t.integer  "reason_for_deletion_id"
    t.integer  "reason_for_visit_cancellation_id"
    t.boolean  "visit_cancelled_over_phone"
    t.string   "listing_request_id"
    t.integer  "counter"
    t.date     "visit_date"
    t.integer  "locality_id"
    t.datetime "dc_start_time"
    t.datetime "dc_end_time"
    t.spatial  "coordinates",                      :limit => {:srid=>0, :type=>"geometry"}
  end

  create_table "listing_requests_actions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_requests_logs", :force => true do |t|
    t.integer  "action_id"
    t.text     "message"
    t.integer  "value_type"
    t.string   "new_value"
    t.string   "old_value"
    t.integer  "listing_request_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "listing_requests_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "localities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
    t.spatial  "coordinates",      :limit => {:srid=>4326, :type=>"point"}
    t.spatial  "boundary_polygon", :limit => {:srid=>3785, :type=>"polygon"}
    t.text     "encoded_polygon"
    t.integer  "sort_priority"
    t.integer  "status_id",                                                   :default => 3
    t.string   "url_name"
    t.text     "filter_param"
  end

  add_index "localities", ["boundary_polygon"], :name => "index_localities_on_boundary_polygon", :spatial => true
  add_index "localities", ["coordinates"], :name => "index_localities_on_coordinates", :spatial => true
  add_index "localities", ["region_id"], :name => "index_localities_on_region_id"
  add_index "localities", ["status_id"], :name => "index_localities_on_status_id"
  add_index "localities", ["url_name"], :name => "index_localities_on_url_name"

  create_table "localities_meta_data", :force => true do |t|
    t.integer  "rent_flat_count"
    t.integer  "buy_flat_count"
    t.integer  "max_rent"
    t.integer  "min_rent"
    t.integer  "max_price"
    t.integer  "min_price"
    t.integer  "locality_id"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "localities_meta_data", ["locality_id"], :name => "index_localities_meta_data_on_locality_id"

  create_table "log_listing_requests", :force => true do |t|
    t.text     "message"
    t.text     "change_old_value"
    t.text     "change_new_value"
    t.integer  "action"
    t.integer  "reason"
    t.integer  "listing_request_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "action"
    t.string   "message"
    t.integer  "user_id"
    t.integer  "listings_id"
    t.string   "listings_type"
    t.datetime "created_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nearby_wishes", :force => true do |t|
    t.string   "name"
    t.string   "prefix"
    t.string   "suffix"
    t.integer  "city_id"
    t.integer  "service_id"
    t.integer  "radius"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
  end

  add_index "nearby_wishes", ["city_id"], :name => "index_nearby_wishes_on_city_id"
  add_index "nearby_wishes", ["coordinates"], :name => "index_nearby_wishes_on_coordinates", :spatial => true
  add_index "nearby_wishes", ["service_id"], :name => "index_nearby_wishes_on_service_id"

  create_table "need_flat_request_furnish_types", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "need_flat_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "localities"
    t.string   "apartment_types"
    t.string   "rent_range"
    t.string   "furnish_types"
    t.text     "comments"
    t.integer  "status"
    t.datetime "callback"
    t.text     "notes"
    t.string   "admin_notes"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "ip_address"
    t.text     "session_id"
    t.boolean  "sms_sent",          :default => false
    t.boolean  "send_sms",          :default => false
    t.integer  "broker_assigned"
    t.integer  "city_id"
    t.integer  "service_type"
    t.integer  "locality_id"
    t.integer  "apartment_type_id"
    t.integer  "furnish_type"
    t.integer  "rent_minimum"
    t.integer  "rent_maximum"
    t.boolean  "has_gym"
    t.boolean  "has_lift"
    t.boolean  "has_parking"
    t.boolean  "has_swimming_pool"
    t.boolean  "has_gas_pipeline"
    t.text     "flats_url"
  end

  add_index "need_flat_requests", ["city_id"], :name => "index_need_flat_requests_on_city_id"

  create_table "need_flat_requests_apartment_types", :force => true do |t|
    t.integer  "need_flat_request_id"
    t.integer  "apartment_type_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "need_flat_requests_apartments_types", :force => true do |t|
    t.integer "need_flat_requests_id"
    t.integer "apartment_types_id"
  end

  create_table "need_flat_requests_brokers", :force => true do |t|
    t.integer  "broker_id"
    t.integer  "need_flat_request_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "need_flat_requests_furnish_types", :force => true do |t|
    t.integer  "need_flat_request_id"
    t.integer  "furnish_type_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "need_flat_requests_notifications", :force => true do |t|
    t.integer  "need_flat_request_id",                    :null => false
    t.string   "context",                                 :null => false
    t.string   "target",                                  :null => false
    t.string   "task",                                    :null => false
    t.boolean  "background",                              :null => false
    t.text     "message"
    t.text     "extra_data"
    t.datetime "send_after"
    t.datetime "sent_at"
    t.integer  "retry_of"
    t.integer  "status_id"
    t.boolean  "retried",              :default => false
    t.boolean  "ignored",              :default => true
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "need_flat_requests_notifications", ["send_after"], :name => "index_need_flat_requests_notifications_on_send_after"
  add_index "need_flat_requests_notifications", ["status_id"], :name => "index_need_flat_requests_notifications_on_status_id"

  create_table "need_flat_requests_ownerships", :force => true do |t|
    t.integer  "need_flat_request_id"
    t.integer  "ownership_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "need_flat_requests_sms_logs", :force => true do |t|
    t.integer  "sms_log_id"
    t.integer  "need_flat_requests_notification_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "need_flat_requests_sms_logs", ["need_flat_requests_notification_id"], :name => "nf_sms_log_nf_nid"
  add_index "need_flat_requests_sms_logs", ["sms_log_id"], :name => "index_need_flat_requests_sms_logs_on_sms_log_id"

  create_table "notification_statuses", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nprs", :force => true do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "object_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "email_id"
    t.integer  "age"
    t.string   "sex"
    t.string   "address",     :null => false
    t.integer  "locality_id", :null => false
    t.boolean  "sms_alert",   :null => false
    t.boolean  "email_alert", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ownerships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permissions", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "resource_id"
  end

  add_index "permissions", ["role_id", "resource_id"], :name => "index_permissions_on_role_id_and_resource_id"

  create_table "phone_number_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phone_number_category_maps", :force => true do |t|
    t.integer "phone_number_id"
    t.integer "phone_number_category_id"
  end

  add_index "phone_number_category_maps", ["phone_number_id", "phone_number_category_id"], :name => "unique_number_category_pair", :unique => true

  create_table "phone_numbers", :force => true do |t|
    t.string   "number"
    t.integer  "person_id"
    t.string   "person_type"
    t.integer  "priority",    :limit => 2, :default => 0
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "phone_numbers", ["person_id"], :name => "index_phone_numbers_on_person_id"
  add_index "phone_numbers", ["person_type"], :name => "index_phone_numbers_on_person_type"

  create_table "power_backup_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "property_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
  end

  add_index "regions", ["city_id"], :name => "index_regions_on_city_id"
  add_index "regions", ["coordinates"], :name => "index_regions_on_coordinates", :spatial => true

  create_table "rent_flat_bedrooms", :force => true do |t|
    t.boolean "has_attached_balcony"
    t.boolean "has_attached_bathroom"
    t.integer "rent_flat_id"
  end

  create_table "rent_flat_lifestyle_fields", :force => true do |t|
    t.string   "restaurant_type"
    t.string   "kids_type"
    t.string   "night_life_type"
    t.string   "hospital_type"
    t.string   "shopping_type"
    t.string   "family_type"
    t.string   "road_connectivity"
    t.string   "bus_connectivity"
    t.string   "train_connectivity"
    t.string   "locality_type"
    t.string   "society_type"
    t.integer  "lifestyle_rating"
    t.integer  "connectivity_score"
    t.integer  "furnishing_score"
    t.integer  "peripheral_score"
    t.integer  "location_score"
    t.integer  "rent_flat_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "lifestyle_rating_type"
    t.decimal  "new_lifestyle_rating",  :precision => 3, :scale => 1
  end

  add_index "rent_flat_lifestyle_fields", ["rent_flat_id"], :name => "index_rent_flat_lifestyle_fields_on_rent_flat_id"

  create_table "rent_flats", :force => true do |t|
    t.integer  "floor_number"
    t.integer  "area"
    t.integer  "rent"
    t.integer  "security_deposit"
    t.string   "flat_number",                                                                                                                      :null => false
    t.string   "building_name",                                                                                                                    :null => false
    t.string   "street_info",                                                                                                                      :null => false
    t.string   "contact_person_name"
    t.string   "contact_person_phone"
    t.string   "key_handler_name"
    t.string   "key_handler_phone"
    t.string   "key_handler_address"
    t.text     "special_instructions_to_data_collector"
    t.integer  "bedroom_count",                          :limit => 2
    t.integer  "bathroom_count",                         :limit => 2
    t.integer  "ac_count",                               :limit => 2
    t.integer  "tv_count",                               :limit => 2
    t.integer  "bed_count",                              :limit => 2
    t.integer  "cupboard_count",                         :limit => 2
    t.integer  "furnish_type",                           :limit => 2
    t.integer  "status",                                 :limit => 2
    t.boolean  "is_rent_negotiable"
    t.boolean  "is_security_deposit_negotiable"
    t.boolean  "has_microwave"
    t.boolean  "has_gas_pipeline"
    t.boolean  "has_refrigerator"
    t.boolean  "has_washing_machine"
    t.boolean  "has_dining_table"
    t.boolean  "has_sofa"
    t.boolean  "has_swimming_pool"
    t.boolean  "has_gym"
    t.boolean  "has_lift"
    t.boolean  "has_parking"
    t.integer  "apartment_type_id"
    t.integer  "locality_id"
    t.integer  "lease_type_id"
    t.integer  "property_type_id"
    t.integer  "society_id"
    t.datetime "created_at",                                                                                                                       :null => false
    t.datetime "updated_at",                                                                                                                       :null => false
    t.spatial  "coordinates",                            :limit => {:srid=>0, :type=>"point"}
    t.boolean  "has_stove"
    t.integer  "user_id"
    t.boolean  "is_contact_person_landlord",                                                                                    :default => false
    t.boolean  "is_brokerage_applicable",                                                                                       :default => true
    t.integer  "data_collector_id"
    t.date     "date_rented"
    t.string   "formatted_rent"
    t.string   "formatted_security_deposit"
    t.integer  "num_of_views",                                                                                                  :default => 0
    t.integer  "num_of_requests",                                                                                               :default => 0
    t.decimal  "property_hotness",                                                                :precision => 8, :scale => 2
    t.date     "available_from"
    t.integer  "power_backup_type_id"
    t.integer  "maintenance_charges"
    t.string   "formatted_maintenance_charges"
    t.boolean  "has_servant_room"
    t.integer  "security_type_id"
    t.boolean  "is_gated_community"
    t.integer  "water_supply_type_id"
    t.boolean  "has_geyser"
    t.text     "canonical_url"
    t.text     "description"
    t.spatial  "center_point",                           :limit => {:srid=>4326, :type=>"point"}
    t.text     "og_tags"
    t.string   "title"
    t.boolean  "are_photographs_satisfactory"
    t.boolean  "is_data_accurate"
    t.boolean  "is_data_entry_satisfactory"
    t.string   "main_entrance_facing"
    t.integer  "floor_height"
    t.boolean  "has_water_purifier"
    t.boolean  "has_garden"
    t.integer  "age_of_property"
    t.integer  "floor_count"
    t.integer  "parking_charges"
    t.string   "formatted_parking_charges"
    t.integer  "images_count"
    t.integer  "freshness_index"
  end

  add_index "rent_flats", ["ac_count"], :name => "index_rent_flats_on_ac_count"
  add_index "rent_flats", ["apartment_type_id"], :name => "index_rent_flats_on_apartment_type_id"
  add_index "rent_flats", ["area"], :name => "index_rent_flats_on_area"
  add_index "rent_flats", ["available_from"], :name => "index_rent_flats_on_available_from"
  add_index "rent_flats", ["bathroom_count"], :name => "index_rent_flats_on_bathroom_count"
  add_index "rent_flats", ["bed_count"], :name => "index_rent_flats_on_bed_count"
  add_index "rent_flats", ["bedroom_count"], :name => "index_rent_flats_on_bedroom_count"
  add_index "rent_flats", ["coordinates"], :name => "index_rent_flats_on_coordinates", :spatial => true
  add_index "rent_flats", ["cupboard_count"], :name => "index_rent_flats_on_cupboard_count"
  add_index "rent_flats", ["data_collector_id"], :name => "index_rent_flats_on_data_collector_id"
  add_index "rent_flats", ["flat_number"], :name => "index_rent_flats_on_flat_number"
  add_index "rent_flats", ["floor_number"], :name => "index_rent_flats_on_floor_number"
  add_index "rent_flats", ["furnish_type"], :name => "index_rent_flats_on_furnish_type"
  add_index "rent_flats", ["has_dining_table"], :name => "index_rent_flats_on_has_dining_table"
  add_index "rent_flats", ["has_gas_pipeline"], :name => "index_rent_flats_on_has_gas_pipeline"
  add_index "rent_flats", ["has_geyser"], :name => "index_rent_flats_on_has_geyser"
  add_index "rent_flats", ["has_gym"], :name => "index_rent_flats_on_has_gym"
  add_index "rent_flats", ["has_lift"], :name => "index_rent_flats_on_has_lift"
  add_index "rent_flats", ["has_microwave"], :name => "index_rent_flats_on_has_microwave"
  add_index "rent_flats", ["has_parking"], :name => "index_rent_flats_on_has_parking"
  add_index "rent_flats", ["has_refrigerator"], :name => "index_rent_flats_on_has_refrigerator"
  add_index "rent_flats", ["has_servant_room"], :name => "index_rent_flats_on_has_servant_room"
  add_index "rent_flats", ["has_sofa"], :name => "index_rent_flats_on_has_sofa"
  add_index "rent_flats", ["has_stove"], :name => "index_rent_flats_on_has_stove"
  add_index "rent_flats", ["has_swimming_pool"], :name => "index_rent_flats_on_has_swimming_pool"
  add_index "rent_flats", ["has_washing_machine"], :name => "index_rent_flats_on_has_washing_machine"
  add_index "rent_flats", ["is_gated_community"], :name => "index_rent_flats_on_is_gated_community"
  add_index "rent_flats", ["lease_type_id"], :name => "index_rent_flats_on_lease_type_id"
  add_index "rent_flats", ["locality_id"], :name => "index_rent_flats_on_locality_id"
  add_index "rent_flats", ["maintenance_charges"], :name => "index_rent_flats_on_maintenance_charges"
  add_index "rent_flats", ["num_of_requests"], :name => "index_rent_flats_on_num_of_requests"
  add_index "rent_flats", ["num_of_views"], :name => "index_rent_flats_on_num_of_views"
  add_index "rent_flats", ["power_backup_type_id"], :name => "index_rent_flats_on_power_backup_type_id"
  add_index "rent_flats", ["property_hotness"], :name => "index_rent_flats_on_property_hotness"
  add_index "rent_flats", ["property_type_id"], :name => "index_rent_flats_on_property_type_id"
  add_index "rent_flats", ["rent"], :name => "index_rent_flats_on_rent"
  add_index "rent_flats", ["security_type_id"], :name => "index_rent_flats_on_security_type_id"
  add_index "rent_flats", ["society_id"], :name => "index_rent_flats_on_society_id"
  add_index "rent_flats", ["status"], :name => "index_rent_flats_on_status"
  add_index "rent_flats", ["tv_count"], :name => "index_rent_flats_on_tv_count"
  add_index "rent_flats", ["user_id"], :name => "index_rent_flats_on_user_id"
  add_index "rent_flats", ["water_supply_type_id"], :name => "index_rent_flats_on_water_supply_type_id"

  create_table "rent_flats_available_from_types", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reported_error_statuses", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reported_error_statuses", ["name"], :name => "index_reported_error_statuses_on_name"

  create_table "reported_error_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reported_error_types", ["name"], :name => "index_reported_error_types_on_name"

  create_table "reported_errors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "flat_id",    :null => false
    t.text     "message"
    t.integer  "status_id",  :null => false
    t.integer  "service_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "type_id",    :null => false
    t.integer  "city_id"
  end

  add_index "reported_errors", ["city_id"], :name => "index_reported_errors_on_city_id"
  add_index "reported_errors", ["service_id"], :name => "index_reported_errors_on_service_id"
  add_index "reported_errors", ["status_id"], :name => "index_reported_errors_on_status_id"
  add_index "reported_errors", ["type_id"], :name => "index_reported_errors_on_type_id"

  create_table "request_logs", :force => true do |t|
    t.integer  "action"
    t.string   "message"
    t.integer  "user_id"
    t.integer  "requests_id"
    t.string   "requests_type"
    t.datetime "created_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "resources", ["name", "parent_id"], :name => "index_resources_on_name_and_parent_id"

  create_table "role_column_accesses", :force => true do |t|
    t.integer  "role_id"
    t.string   "table_name"
    t.string   "column_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "role_column_accesses", ["role_id", "table_name"], :name => "index_role_column_accesses_on_role_id_and_table_name"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "role_type"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"

  create_table "security_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "url_name"
  end

  create_table "sms_logs", :force => true do |t|
    t.string   "phone_number"
    t.text     "message_text"
    t.string   "error_message"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sms_statuses", :force => true do |t|
    t.string   "status_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "societies", :force => true do |t|
    t.string   "name",                                                 :null => false
    t.integer  "locality_id",                                          :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.spatial  "coordinates", :limit => {:srid=>4326, :type=>"point"}
  end

  add_index "states", ["coordinates"], :name => "index_states_on_coordinates", :spatial => true
  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sub_localities", :force => true do |t|
    t.string   "name"
    t.integer  "locality_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sub_localities", ["locality_id"], :name => "index_sub_localities_on_locality_id"

  create_table "tehsils", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.spatial  "coordinates", :limit => {:srid=>0, :type=>"point"}
  end

  add_index "tehsils", ["city_id"], :name => "index_tehsils_on_city_id"

  create_table "train_stations", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.boolean  "is_local_only",                                          :default => false
    t.datetime "created_at",                                                                :null => false
    t.datetime "updated_at",                                                                :null => false
    t.spatial  "coordinates",   :limit => {:srid=>4326, :type=>"point"}
  end

  add_index "train_stations", ["is_local_only"], :name => "index_train_stations_on_is_local_only"
  add_index "train_stations", ["name"], :name => "index_train_stations_on_name"

  create_table "user_buy_flats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "buy_flat_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_buy_flats", ["buy_flat_id"], :name => "index_user_buy_flats_on_buy_flat_id"
  add_index "user_buy_flats", ["user_id"], :name => "index_user_buy_flats_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "contact_no"
    t.integer  "parent_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["email", "contact_no"], :name => "index_users_on_email_and_contact_no", :unique => true
  add_index "users", ["profile_type"], :name => "index_users_on_profile_type"

  create_table "villages", :force => true do |t|
    t.string   "name"
    t.integer  "tehsil_id"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.spatial  "coordinates", :limit => {:srid=>0, :type=>"point"}
  end

  add_index "villages", ["tehsil_id"], :name => "index_villages_on_tehsil_id"

  create_table "visit_requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "request_ids"
    t.integer  "status"
    t.datetime "callback"
    t.string   "notes"
    t.string   "admin_notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "water_supply_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "city_id"
  end

  add_index "water_supply_types", ["city_id"], :name => "index_water_supply_types_on_city_id"

end
