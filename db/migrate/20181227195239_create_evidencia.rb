class CreateEvidencia < ActiveRecord::Migration[5.1]
  def change
    create_table :evidencia do |t|
      t.string :imagen
      t.references :comprobacion, foreign_key: true

      t.timestamps
    end
  end
end
