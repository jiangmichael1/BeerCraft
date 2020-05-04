class CreateUserDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_drinks do |t|
      t.integer :user_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
