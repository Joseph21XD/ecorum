class CreateFavoritos < ActiveRecord::Migration[5.1]
  def change
    create_table :favoritos do |t|
      t.references :usuario, foreign_key: true
      t.references :evento, foreign_key: true

      t.timestamps
    end
  end
end
