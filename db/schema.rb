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

ActiveRecord::Schema.define(version: 2019_07_15_113948) do

<<<<<<< HEAD
  create_table "banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "banks", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.string "bank_name"
    t.string "branch"
    t.string "kind"
    t.integer "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "bells", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "bells", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "read"
    t.integer "request_id"
    t.integer "sender_id"
  end

<<<<<<< HEAD
  create_table "breeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "breeds", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "request_id"
    t.string "breed1"
    t.string "breed2"
    t.string "breed3"
    t.datetime "waiting"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

<<<<<<< HEAD
  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "cards", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "number"
    t.integer "year"
    t.integer "mouth"
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

<<<<<<< HEAD
  create_table "dog_evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "dog_evaluations", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "rater_id"
    t.integer "overall"
    t.string "comment"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dog_id"
  end

<<<<<<< HEAD
  create_table "dogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "dogs", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.string "name"
    t.string "image_name"
    t.string "sex"
    t.string "birthday"
    t.string "dog_breed"
    t.string "weight"
    t.string "castration"
    t.string "rabies"
    t.string "character"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

<<<<<<< HEAD
  create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "entries", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "request_id"
    t.integer "user_id"
    t.integer "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "evaluations", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "rater_id"
    t.integer "overall"
    t.string "comment"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "request_id"
  end

<<<<<<< HEAD
  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "follows", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "receive"
    t.integer "valule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "histories", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "partner"
    t.integer "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "information", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "information", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.string "user_id"
    t.string "dog_id"
    t.string "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "inquiries", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "messeages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "messeages", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "send_id"
    t.integer "post_id"
    t.text "messe"
    t.integer "rewuest_id"
    t.integer "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "privates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "privates", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "rater_id"
    t.integer "communication"
    t.integer "service"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "questions", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.text "content"
    t.string "kind"
    t.string "emai"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "request_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "request_details", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "request_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pay"
    t.integer "recieve"
    t.integer "already"
    t.integer "status"
  end

<<<<<<< HEAD
  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "requests", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.datetime "waiting"
    t.datetime "end"
    t.string "adress"
    t.string "walk"
    t.string "walk_time"
    t.string "bait"
    t.string "snack"
    t.string "toilet"
    t.string "comment_ok"
    t.string "caretaker"
    t.string "child"
    t.string "native"
    t.string "animal"
    t.string "comment_ng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "dog_id"
    t.integer "dog_id2"
    t.integer "dog_id3"
    t.integer "status"
    t.integer "choice"
    t.integer "status_partner"
  end

<<<<<<< HEAD
  create_table "status_dogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "status_dogs", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.string "user_id"
    t.string "dog_id"
    t.string "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "statuses", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.string "introduction"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

<<<<<<< HEAD
  create_table "storages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "storages", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "rater_id"
    t.string "comment"
    t.integer "overall"
    t.integer "communication"
    t.integer "service"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "request_id"
  end

<<<<<<< HEAD
  create_table "token2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "token2s", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.string "uuid"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "transfers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
=======
  create_table "tokens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", force: :cascade do |t|
>>>>>>> refs/remotes/origin/master
    t.integer "user_id"
    t.integer "total"
    t.integer "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

<<<<<<< HEAD
  create_table "user_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "phone"
=======
  create_table "user_details", force: :cascade do |t|
    t.integer "user_id"
    t.string "phone"
>>>>>>> refs/remotes/origin/master
    t.string "name_last"
    t.string "name_first"
    t.string "name_last_reading"
    t.string "name_first_reading"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_kind"
    t.string "id_image1"
    t.string "id_image2"
    t.integer "approval"
    t.integer "pay"
  end

<<<<<<< HEAD
  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "birthday"
    t.string "birthday1"
    t.string "image_header"
    t.datetime "time"
    t.integer "created"
    t.string "sex", limit: 10
    t.string "password_digest"
    t.string "image_name"
  end
=======
# Could not dump table "users" because of following StandardError
#   Unknown type '' for column 'password_digest'
>>>>>>> refs/remotes/origin/master

end
