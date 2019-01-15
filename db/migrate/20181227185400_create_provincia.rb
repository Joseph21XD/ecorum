class CreateProvincia < ActiveRecord::Migration[5.1]
  def change
    create_table :provincia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
