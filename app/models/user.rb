class User < ApplicationRecord
    has_many :user_products
    has_many :products, through: :user_products
    has_many :user_drinks
    has_many :drinks, through: :user_drinks
    has_many :product_drinks
    has_secure_password
    acts_as_voter

    validates :age, numericality: {greater_than_or_equal_to: 21}
    validates :name, presence: true
    validates :name, uniqueness: true

    def my_drinks
    @mine = UserDrink.where(user_id: self.id)
    @mine.all.each do |userdrink|
        userdrink.drink.name
    end
    end

    def my_cart
      @myproducts = UserProduct.where(user_id: self.id)
      @myproducts.all.each do |userproduct|
          userproduct.product.name
      end
    end


end
