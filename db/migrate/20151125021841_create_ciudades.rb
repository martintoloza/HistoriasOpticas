class CreateCiudades < ActiveRecord::Migration
  def change
    create_table :ciudades do |t|
      t.string :codigo,	 limit:  5
      t.string :nombre,	 limit: 60
      t.references :departamento, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :ciudades, :codigo, unique: true
  end
end
