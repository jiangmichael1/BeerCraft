class User < ApplicationRecord
    has_many :user_products
    has_many :products, through: :user_products
    has_many :user_drinks
    has_many :drinks, through: :user_drinks

    validates :age, numericality: {greater_than_or_equal_to: 21}
    validates :name, presence: true

    def my_drinks
        mydrinks = UserDrink.find_by(user_id: self)
        mydrinks.drink.name
    end

    def my_cart
        mycart = UserProduct.find_by(user_id: self)
        mycart.product.name
    end

end
