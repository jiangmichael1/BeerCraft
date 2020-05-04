class CreateProductDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :product_drinks do |t|
      t.integer :product_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
