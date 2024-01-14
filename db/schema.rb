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

ActiveRecord::Schema.define(version: 2024_01_11_121351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.date "release_date", null: false
    t.string "runtime"
    t.string "genre"
    t.string "parental_rating"
    t.text "plot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "rating"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.integer "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
  end

  add_foreign_key "ratings", "movies"

  create_view "views_rated_movie_by_genres", sql_definition: <<-SQL
      SELECT DISTINCT ON (m.genre) m.genre,
      m.title AS movie,
      r.grade
     FROM (movies m
       JOIN ratings r ON ((m.id = r.movie_id)))
    WHERE (((m.genre)::text, r.grade) IN ( SELECT movies.genre,
              max(ratings.grade) AS max_grade
             FROM (movies
               JOIN ratings ON ((movies.id = ratings.movie_id)))
            GROUP BY movies.genre));
  SQL
  create_view "views_rated_movie_by_parentals", sql_definition: <<-SQL
      SELECT DISTINCT ON (m.parental_rating) m.parental_rating,
      m.title AS movie,
      r.grade
     FROM (movies m
       JOIN ratings r ON ((m.id = r.movie_id)))
    WHERE (((m.parental_rating)::text, r.grade) IN ( SELECT movies.parental_rating,
              max(ratings.grade) AS max_grade
             FROM (movies
               JOIN ratings ON ((movies.id = ratings.movie_id)))
            GROUP BY movies.parental_rating));
  SQL
end
