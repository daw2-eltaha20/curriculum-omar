class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image
      t.string :name
      t.string :manufacturer
      t.decimal :price
      t.boolean :status

      t.timestamps
    end
  end
end
