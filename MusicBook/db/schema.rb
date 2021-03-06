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

ActiveRecord::Schema.define(version: 20170827210223) do

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.date "dob"
    t.string "placeOfBirth"
    t.string "state"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_favourites_on_song_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "playlist_songs", force: :cascade do |t|
    t.integer "song_id"
    t.integer "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_songs_on_playlist_id"
    t.index ["song_id"], name: "index_playlist_songs_on_song_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.integer "numOfSongs"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "artist_id"
    t.integer "album_id"
    t.integer "genre_id"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ytlink"
    t.integer "user_id"
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["genre_id"], name: "index_songs_on_genre_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role"
  end

end
