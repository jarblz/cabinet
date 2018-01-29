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

ActiveRecord::Schema.define(version: 20180126225205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_questions", force: :cascade do |t|
    t.string  "category",                null: false
    t.string  "question",                null: false
    t.string  "page_number",             null: false
    t.integer "format",      default: 0, null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "status"
    t.integer "ie"
    t.integer "vn"
    t.integer "oa"
    t.integer "sm"
    t.integer "pt"
  end

  create_table "candidate_industries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "industry_id"
    t.string  "experience"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",              default: "", null: false
    t.string   "contact_email",     default: "", null: false
    t.string   "phone",             default: "", null: false
    t.string   "bio",               default: "", null: false
    t.integer  "status",            default: 0,  null: false
    t.string   "code",              default: "", null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "account_limit",     default: 5
    t.string   "slug"
    t.index ["slug"], name: "index_companies_on_slug", unique: true, using: :btree
  end

  create_table "company_traits", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "trait_id",   null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
  end

  create_table "job_posting_competencies", force: :cascade do |t|
    t.integer "job_posting_id", null: false
    t.integer "competency_id",  null: false
  end

  create_table "job_posting_traits", force: :cascade do |t|
    t.integer "job_posting_id", null: false
    t.integer "trait_id",       null: false
  end

  create_table "job_posting_users", force: :cascade do |t|
    t.integer "job_posting_id", null: false
    t.integer "user_id",        null: false
  end

  create_table "job_postings", force: :cascade do |t|
    t.integer "creator_id",  null: false
    t.integer "company_id",  null: false
    t.string  "title",       null: false
    t.text    "description", null: false
    t.string  "slug"
    t.index ["slug"], name: "index_job_postings_on_slug", unique: true, using: :btree
  end

  create_table "personalities", force: :cascade do |t|
    t.string "name",        null: false
    t.string "code",        null: false
    t.string "description", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id", using: :btree
  end

  create_table "traits", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_recruiter"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "", null: false
    t.string   "name"
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "company_id"
    t.string   "phone"
    t.string   "country"
    t.string   "zip_code"
    t.boolean  "us_lawfully_authorized"
    t.boolean  "require_sponsorship"
    t.integer  "felony"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "writing_sample_file_name"
    t.string   "writing_sample_content_type"
    t.integer  "writing_sample_file_size"
    t.datetime "writing_sample_updated_at"
    t.string   "transcript_file_name"
    t.string   "transcript_content_type"
    t.integer  "transcript_file_size"
    t.datetime "transcript_updated_at"
    t.integer  "race"
    t.integer  "gender"
    t.integer  "student_professional"
    t.string   "current_employer"
    t.string   "current_position"
    t.string   "website_url"
    t.string   "github_url"
    t.string   "linkedin_url"
    t.string   "facebook_url"
    t.integer  "personality_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

end
