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

ActiveRecord::Schema.define(:version => 20121128103112) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "unique_identifier"
    t.string   "password_digest"
    t.string   "image_url"
    t.text     "auth"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "identities", ["provider"], :name => "index_identities_on_provider"
  add_index "identities", ["unique_identifier"], :name => "index_identities_on_unique_identifier", :unique => true
  add_index "identities", ["user_id"], :name => "index_identities_on_user_id"

  create_table "possible_answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "text"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "possible_answers", ["question_id"], :name => "index_possible_answers_on_question_id"

  create_table "questions", :force => true do |t|
    t.integer  "quiz_id"
    t.text     "text"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "order",      :default => 0
    t.text     "more_info"
  end

  add_index "questions", ["order"], :name => "index_questions_on_order"
  add_index "questions", ["quiz_id"], :name => "index_questions_on_quiz_id"

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.text     "introduction"
    t.boolean  "featured"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "quizzes", ["featured"], :name => "index_quizzes_on_featured"
  add_index "quizzes", ["owner_id"], :name => "index_quizzes_on_owner_id"

  create_table "responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.text     "why"
    t.string   "session_id"
    t.integer  "rejected_by_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "responses", ["answer_id"], :name => "index_responses_on_answer_id"
  add_index "responses", ["rejected_by_id"], :name => "index_responses_on_rejected_by_id"
  add_index "responses", ["session_id"], :name => "index_responses_on_session_id"
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
    t.boolean  "editor",          :default => false
    t.string   "display_name"
  end

end
