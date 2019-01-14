class CreateComprobacions < ActiveRecord::Migration[5.1]
  def change
    create_table :comprobacions do |t|
      t.references :usuario, foreign_key: true
      t.references :evento, foreign_key: true
      t.text :comentario
      t.text :comentarioAdmin

      t.timestamps
    end
  end
end
