# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_20_141249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "description"
    t.string "url"
    t.string "image_url"
    t.bigint "emoji_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emoji_id"], name: "index_books_on_emoji_id"
  end

  create_table "emojis", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value"
    t.string "animation"
    t.string "fadeanimation"
  end

  create_table "journals", force: :cascade do |t|
    t.text "content"
    t.date "date"
    t.bigint "logbook_id", null: false
    t.bigint "prompt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "time"
    t.index ["logbook_id"], name: "index_journals_on_logbook_id"
    t.index ["prompt_id"], name: "index_journals_on_prompt_id"
  end

  create_table "logbooks", force: :cascade do |t|
    t.text "summary"
    t.date "date"
    t.bigint "emoji_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "time"
    t.index ["emoji_id"], name: "index_logbooks_on_emoji_id"
    t.index ["user_id"], name: "index_logbooks_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.string "description"
    t.string "url"
    t.string "image_url"
    t.bigint "emoji_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year"
    t.index ["emoji_id"], name: "index_movies_on_emoji_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "image_url"
    t.bigint "emoji_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emoji_id"], name: "index_playlists_on_emoji_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "logbook_id"
    t.string "playlist_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.bigint "movie_id"
    t.index ["book_id"], name: "index_recommendations_on_book_id"
    t.index ["logbook_id"], name: "index_recommendations_on_logbook_id"
    t.index ["movie_id"], name: "index_recommendations_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "books", "emojis"
  add_foreign_key "journals", "logbooks"
  add_foreign_key "journals", "prompts"
  add_foreign_key "logbooks", "emojis"
  add_foreign_key "logbooks", "users"
  add_foreign_key "movies", "emojis"
  add_foreign_key "playlists", "emojis"
  add_foreign_key "recommendations", "books"
  add_foreign_key "recommendations", "logbooks"
  add_foreign_key "recommendations", "movies"
end
