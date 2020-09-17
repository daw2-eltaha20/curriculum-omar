class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nombre
      t.string :apellido
      t.string :calle
      t.string :localidad
      t.string :codigo_postal
      t.string :telefono
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
