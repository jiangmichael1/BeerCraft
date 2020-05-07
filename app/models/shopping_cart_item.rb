class ShoppingCartItem < ApplicationRecord
    acts_as_shopping_cart_item_for :shopping_cart
end
