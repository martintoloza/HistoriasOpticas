class CreateCiudades < ActiveRecord::Migration
	def change
    create_table :ciudades do |t|
      t.string :codigo,	 limit:  5
      t.string :nombre,	 limit: 60
    end

    add_index :ciudades, :codigo, unique: true
  end
end