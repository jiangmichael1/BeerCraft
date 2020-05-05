class Drink < ApplicationRecord
    has_many :user_drinks
    has_many :users, through: :user_drinks
    has_many :product_drinks
    has_many :products, through: :product_drinks

    validates :recipe, :name, presence: true
  

end
