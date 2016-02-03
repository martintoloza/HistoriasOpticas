class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :tipoiden,  limit:   2, default: "CC"
      t.string :nroiden,   limit:  15
      t.string :pri_ape,   limit:  20
      t.string :seg_ape,   limit:  20
      t.string :pri_nom,   limit:  20
      t.string :seg_nom,   limit:  20
      t.string :sexo,      limit:   1, default: "M"
      t.date :fechanac
      t.string :uniedad,   limit:   1, default: "1"
      t.integer :edad,     limit:   3
      t.string :zonaresi,  limit:   1, default: "U"
      t.string :direccion, limit:  60
      t.string :email,     limit:  60
      t.string :tipousua,  limit:   1, default: "5"
      t.string :tipoafili, limit:   1, default: "C"
      t.string :est_civil, limit:   1, default: "S"
      t.integer :estado,   limit:   1, default: 1, null: false
      t.references :ciudad, index: true, foreign_key: true
      t.references :barrio, index: true, foreign_key: true
      t.references :profesion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
