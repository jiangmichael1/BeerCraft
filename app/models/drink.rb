class Drink < ApplicationRecord
    has_many :user_drinks
    has_many :users, through: :user_drinks
    has_many :product_drinks
    has_many :products, through: :product_drinks
    has_many :users, through: :product_drinks
    has_many :likes, dependent: :destroy

    validates :recipe, :name, presence: true
  
def self.recipe
    self.recipe
end
    

end
