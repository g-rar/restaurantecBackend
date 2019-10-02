# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_01_203653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calificaciones", primary_key: "idcalificacion", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "correousuario", limit: 25
    t.string "restaurante", limit: 20
    t.float "calificacion"
  end

  create_table "comentarios", primary_key: "idcomentario", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "correousuario", limit: 25
    t.string "restaurante", limit: 20
    t.string "comentario", limit: 150
    t.date "fecha"
  end

  create_table "restaurantes", primary_key: "nombrerest", id: :string, limit: 20, force: :cascade do |t|
    t.float "latitudrest"
    t.float "longitudrest"
    t.string "tiporest", limit: 15, null: false
    t.float "calificacionrest"
    t.string "preciorest", limit: 3
  end

  create_table "telefonos", primary_key: "restaurante", id: :string, limit: 20, force: :cascade do |t|
    t.integer "numtelefono"
    t.string "tipotel", limit: 10
  end

  create_table "usuarios", primary_key: "idusuario", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "correousuario", limit: 25
    t.string "nombreusuario", limit: 20
    t.string "apellidousuario", limit: 20
    t.string "contrasenausuario", limit: 10
    t.integer "tipousuario", limit: 2
    t.index ["correousuario"], name: "usuarios_correousuario_key", unique: true
  end

  add_foreign_key "calificaciones", "restaurantes", column: "restaurante", primary_key: "nombrerest", name: "calificaciones_restaurante_fkey"
  add_foreign_key "calificaciones", "usuarios", column: "correousuario", primary_key: "correousuario", name: "calificaciones_correousuario_fkey"
  add_foreign_key "comentarios", "restaurantes", column: "restaurante", primary_key: "nombrerest", name: "comentarios_restaurante_fkey"
  add_foreign_key "comentarios", "usuarios", column: "correousuario", primary_key: "correousuario", name: "comentarios_correousuario_fkey"
  add_foreign_key "telefonos", "restaurantes", column: "restaurante", primary_key: "nombrerest", name: "telefonos_restaurante_fkey"
end
