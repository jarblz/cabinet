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

ActiveRecord::Schema.define(version: 20180212162436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_questions", force: :cascade do |t|
    t.string   "category",                null: false
    t.string   "question",                null: false
    t.string   "page_number",             null: false
    t.integer  "format",      default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "ie",         default: 0
    t.integer  "vn",         default: 0
    t.integer  "oa",         default: 0
    t.integer  "sm",         default: 0
    t.integer  "pt",         default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "candidate_industries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "industry_id"
    t.string   "experience"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",              default: "", null: false
    t.string   "contact_email",     default: "", null: false
    t.string   "phone",             default: "", null: false
    t.string   "bio",               default: "", null: false
    t.integer  "status",            default: 0,  null: false
    t.string   "code",              default: "", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "account_limit",     default: 5
    t.string   "slug"
    t.index ["slug"], name: "index_companies_on_slug", unique: true, using: :btree
  end

  create_table "company_traits", force: :cascade do |t|
    t.integer  "company_id", null: false
    t.integer  "trait_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.integer  "connection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_id"], name: "index_conversations_on_author_id", using: :btree
    t.index ["connection_id"], name: "index_conversations_on_connection_id", using: :btree
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id", using: :btree
  end

  create_table "cp_first_synonyms", force: :cascade do |t|
    t.integer  "competency_id"
    t.integer  "first_synonym_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["competency_id", "first_synonym_id"], name: "index_cp_first_synonyms_on_competency_id_and_first_synonym_id", unique: true, using: :btree
    t.index ["competency_id"], name: "index_cp_first_synonyms_on_competency_id", using: :btree
    t.index ["first_synonym_id"], name: "index_cp_first_synonyms_on_first_synonym_id", using: :btree
  end

  create_table "cp_second_synonyms", force: :cascade do |t|
    t.integer  "competency_id"
    t.integer  "second_synonym_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["competency_id", "second_synonym_id"], name: "index_cp_second_synonyms_on_competency_id_and_second_synonym_id", unique: true, using: :btree
    t.index ["competency_id"], name: "index_cp_second_synonyms_on_competency_id", using: :btree
    t.index ["second_synonym_id"], name: "index_cp_second_synonyms_on_second_synonym_id", using: :btree
  end

  create_table "cp_third_synonyms", force: :cascade do |t|
    t.integer  "competency_id"
    t.integer  "third_synonym_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["competency_id", "third_synonym_id"], name: "index_cp_third_synonyms_on_competency_id_and_third_synonym_id", unique: true, using: :btree
    t.index ["competency_id"], name: "index_cp_third_synonyms_on_competency_id", using: :btree
    t.index ["third_synonym_id"], name: "index_cp_third_synonyms_on_third_synonym_id", using: :btree
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_posting_competencies", force: :cascade do |t|
    t.integer  "job_posting_id", null: false
    t.integer  "competency_id",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "job_posting_traits", force: :cascade do |t|
    t.integer  "job_posting_id", null: false
    t.integer  "trait_id",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "job_posting_users", force: :cascade do |t|
    t.integer  "job_posting_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "job_postings", force: :cascade do |t|
    t.integer  "creator_id",  null: false
    t.integer  "company_id",  null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.boolean  "remote"
    t.string   "zip_code"
    t.index ["slug"], name: "index_job_postings_on_slug", unique: true, using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "personalities", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "code",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer  "job_posting_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "status",         default: 0
    t.decimal  "score",          default: "0.25"
    t.boolean  "recruiter_seen", default: false
    t.boolean  "candidate_seen", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
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

  create_table "trait_first_synonyms", force: :cascade do |t|
    t.integer  "trait_id"
    t.integer  "first_synonym_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["first_synonym_id"], name: "index_trait_first_synonyms_on_first_synonym_id", using: :btree
    t.index ["trait_id", "first_synonym_id"], name: "index_trait_first_synonyms_on_trait_id_and_first_synonym_id", unique: true, using: :btree
    t.index ["trait_id"], name: "index_trait_first_synonyms_on_trait_id", using: :btree
  end

  create_table "trait_second_synonyms", force: :cascade do |t|
    t.integer  "trait_id"
    t.integer  "second_synonym_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["second_synonym_id"], name: "index_trait_second_synonyms_on_second_synonym_id", using: :btree
    t.index ["trait_id", "second_synonym_id"], name: "index_trait_second_synonyms_on_trait_id_and_second_synonym_id", unique: true, using: :btree
    t.index ["trait_id"], name: "index_trait_second_synonyms_on_trait_id", using: :btree
  end

  create_table "trait_third_synonyms", force: :cascade do |t|
    t.integer  "trait_id"
    t.integer  "third_synonym_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["third_synonym_id"], name: "index_trait_third_synonyms_on_third_synonym_id", using: :btree
    t.index ["trait_id", "third_synonym_id"], name: "index_trait_third_synonyms_on_trait_id_and_third_synonym_id", unique: true, using: :btree
    t.index ["trait_id"], name: "index_trait_third_synonyms_on_trait_id", using: :btree
  end

  create_table "traits", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_recruiter"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_competencies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competency_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_traits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trait_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean  "remote"
    t.boolean  "unvetted_matcher"
    t.string   "slug"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

  add_foreign_key "cp_first_synonyms", "competencies"
  add_foreign_key "cp_first_synonyms", "competencies", column: "first_synonym_id"
  add_foreign_key "cp_second_synonyms", "competencies"
  add_foreign_key "cp_second_synonyms", "competencies", column: "second_synonym_id"
  add_foreign_key "cp_third_synonyms", "competencies"
  add_foreign_key "cp_third_synonyms", "competencies", column: "third_synonym_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "trait_first_synonyms", "traits"
  add_foreign_key "trait_first_synonyms", "traits", column: "first_synonym_id"
  add_foreign_key "trait_second_synonyms", "traits"
  add_foreign_key "trait_second_synonyms", "traits", column: "second_synonym_id"
  add_foreign_key "trait_third_synonyms", "traits"
  add_foreign_key "trait_third_synonyms", "traits", column: "third_synonym_id"
end
