class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :correo
      t.string :contrasenna
      t.string :imagen
      t.integer :puntaje
      t.references :tipo_usuario, foreign_key: true

      t.timestamps
    end
  end
end
