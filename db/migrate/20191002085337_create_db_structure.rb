class CreateDbStructure < ActiveRecord::Migration[6.0]
  def change
    create_table "calificaciones", primary_key: "idcalificacion", id: :integer, limit: 2, default: nil, force: :cascade do |t|
      t.string "correousuario", limit: 25
      t.string "restaurante", limit: 20
      t.float "calificacion"
    end

    create_table "comentarios", primary_key: "idcomentario", id: :integer, limit: 2, default: nil, force: :cascade do |t|
      t.string "correousuario", limit: 25
      t.string "restaurante", limit: 20
      t.string "cuerpo_comentario", limit: 150
      t.date "fecha"
    end

    create_table "restaurantes", primary_key: "nombrerest", id: :string, limit: 20, force: :cascade do |t|
      t.float "latitudrest"
      t.float "longitudrest"
      t.string "tiporest", limit: 15, null: false
      t.float "calificacionrest"
      t.string "preciorest", limit: 3
      t.integer "numtelefono"
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
  end
end
