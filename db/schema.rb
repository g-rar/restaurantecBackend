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

ActiveRecord::Schema.define(version: 2019_09_25_170721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calificaciones", id: false, force: :cascade do |t|
    t.string "usuario", limit: 10
    t.string "restaurante", limit: 20
    t.float "calificacion"
  end

  create_table "comentarios", primary_key: "idcomentario", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "usuario", limit: 10
    t.string "restaurante", limit: 20
    t.string "comentario", limit: 150
    t.date "fecha"
  end

  create_table "restaurantes", primary_key: "idrest", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "nombrerest", limit: 20
    t.float "latitudrest"
    t.float "longitudrest"
    t.string "tiporest", limit: 15, null: false
    t.float "calificacionrest"
    t.string "preciorest", limit: 3
    t.index ["nombrerest"], name: "restaurantes_nombrerest_key", unique: true
  end

  create_table "telefonos", primary_key: "idrestaurante", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.integer "numtelefono"
    t.string "tipotel", limit: 10
  end

  create_table "usuarios", primary_key: "idusuario", id: :integer, limit: 2, default: nil, force: :cascade do |t|
    t.string "usuario", limit: 10
    t.string "nombreusuario", limit: 20
    t.string "apellidousuario", limit: 20
    t.string "correousuario", limit: 25
    t.string "contrasenausuario", limit: 10
    t.index ["usuario"], name: "usuarios_usuario_key", unique: true
  end

end
