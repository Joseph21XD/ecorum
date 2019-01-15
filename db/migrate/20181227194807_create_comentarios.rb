class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.references :usuario, foreign_key: true
      t.references :evento, foreign_key: true
      t.text :detalle

      t.timestamps
    end
  end
end
