class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :recipe
      t.integer :likes

      t.timestamps
    end
  end
end
