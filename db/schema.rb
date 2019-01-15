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

ActiveRecord::Schema.define(version: 20190114210932) do

  create_table "comentarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "usuario_id"
    t.bigint "evento_id"
    t.text "detalle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_comentarios_on_evento_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "comprobacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "usuario_id"
    t.bigint "evento_id"
    t.text "comentario"
    t.text "comentarioAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_comprobacions_on_evento_id"
    t.index ["usuario_id"], name: "index_comprobacions_on_usuario_id"
  end

  create_table "eventos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "fechaHora"
    t.string "ubicacion"
    t.bigint "usuario_id"
    t.text "descripcion"
    t.string "latitud"
    t.string "longuitud"
    t.string "imagen"
    t.integer "puntaje"
    t.bigint "tipo_evento_id"
    t.bigint "provincium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["provincium_id"], name: "index_eventos_on_provincium_id"
    t.index ["tipo_evento_id"], name: "index_eventos_on_tipo_evento_id"
    t.index ["usuario_id"], name: "index_eventos_on_usuario_id"
  end

  create_table "evidencia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "imagen"
    t.bigint "comprobacion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comprobacion_id"], name: "index_evidencia_on_comprobacion_id"
  end

  create_table "favoritos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "usuario_id"
    t.bigint "evento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_favoritos_on_evento_id"
    t.index ["usuario_id"], name: "index_favoritos_on_usuario_id"
  end

  create_table "provincia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_eventos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "correo"
    t.string "contrasenna"
    t.string "imagen"
    t.integer "puntaje"
    t.bigint "tipo_usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["tipo_usuario_id"], name: "index_usuarios_on_tipo_usuario_id"
  end

  add_foreign_key "comentarios", "eventos"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "comprobacions", "eventos"
  add_foreign_key "comprobacions", "usuarios"
  add_foreign_key "eventos", "provincia"
  add_foreign_key "eventos", "tipo_eventos"
  add_foreign_key "eventos", "usuarios"
  add_foreign_key "evidencia", "comprobacions"
  add_foreign_key "favoritos", "eventos"
  add_foreign_key "favoritos", "usuarios"
  add_foreign_key "usuarios", "tipo_usuarios"
end
