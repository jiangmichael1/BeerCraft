class RemoveLikesFromDrinks < ActiveRecord::Migration[6.0]
  def change
  remove_column :drinks, :likes, :integer
  end
end
