class CreateTipoUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_usuarios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
