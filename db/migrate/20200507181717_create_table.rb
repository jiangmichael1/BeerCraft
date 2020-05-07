class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :shopping_cart_items
    end
  end
end
