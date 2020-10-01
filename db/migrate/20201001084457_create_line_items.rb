class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.numeric :quantity
      t.decimal :unit_price
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
