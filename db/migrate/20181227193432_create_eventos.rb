class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.datetime :fechaHora
      t.string :ubicacion
      t.references :usuario, foreign_key: true
      t.text :descripcion
      t.string :latitud
      t.string :longuitud
      t.string :imagen
      t.integer :puntaje
      t.references :tipo_evento, foreign_key: true
      t.references :provincium, foreign_key: true

      t.timestamps
    end
  end
end
