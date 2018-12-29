class CreateTipoEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_eventos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
