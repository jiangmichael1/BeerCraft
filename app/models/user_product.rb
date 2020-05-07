class UserProduct < ApplicationRecord
    belongs_to :user 
    belongs_to :product 
    #acts_as_shopping_cart_using :product


def count
#to count quantity 
end



end
