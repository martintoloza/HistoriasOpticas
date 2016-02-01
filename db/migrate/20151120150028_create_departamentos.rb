class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :codigo,	 limit:  2
      t.string :nombre,	 limit: 60

      t.timestamps null: false
    end
  end
end
