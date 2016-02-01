class CreateProfesiones < ActiveRecord::Migration
  def change
    create_table :profesiones do |t|
      t.string :codigo,	 limit:   5
      t.string :nombre,	 limit: 100

      t.timestamps null: false
    end
  end
end
