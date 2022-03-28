class CreateStore < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :rating
      t.boolean :sale

      t.timestamps
    end
  end
end
