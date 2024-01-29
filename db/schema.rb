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

ActiveRecord::Schema[7.0].define(version: 2024_01_29_123514) do
  create_table "banques", force: :cascade do |t|
    t.string "nom"
    t.string "siret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cgps", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "telephone"
    t.integer "banque_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.date "date_naissance"
    t.string "situation_matrimoniale"
    t.string "regime_matrimonial"
    t.boolean "presence_enfants"
    t.string "civilite", default: "Monsieur"
    t.string "email"
    t.string "telephone_principal"
    t.string "telephone_secondaire"
    t.text "adresse"
    t.string "code_postal"
    t.string "ville"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cgp_id"
  end

  create_table "entreprises", force: :cascade do |t|
    t.string "nom"
    t.string "forme_juridique"
    t.string "activite"
    t.decimal "capital_social"
    t.decimal "valeur_estimee"
    t.decimal "chiffre_affaires"
    t.decimal "resultat_net"
    t.integer "client_id"
    t.integer "entreprise_mere_id"
    t.date "date_creation"
    t.date "date_acquisition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "taux_detention"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.integer "cgp_id"
    t.integer "banque_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
