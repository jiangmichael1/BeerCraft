class ShoppingCart < ApplicationRecord
    acts_as_shopping_cart_using :shopping_cart_item


end
