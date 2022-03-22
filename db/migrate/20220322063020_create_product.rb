class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :quantity
      t.boolean :on_sale
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
