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

ActiveRecord::Schema.define(:version => 20120915191157) do

  create_table "content_images", :force => true do |t|
    t.string  "image_uri"
    t.integer "content_id"
  end

  create_table "content_texts", :force => true do |t|
    t.text    "body_text"
    t.integer "content_id"
  end

  create_table "contents", :force => true do |t|
    t.string "page_id"
    t.string "title"
    t.string "subtitle"
  end

end