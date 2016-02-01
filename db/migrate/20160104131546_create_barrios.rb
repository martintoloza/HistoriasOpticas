class CreateBarrios < ActiveRecord::Migration
  def change
    create_table :barrios do |t|
      t.string :nombre,	 limit: 100
      t.references :ciudad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
