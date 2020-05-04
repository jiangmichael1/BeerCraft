class ProductDrink < ApplicationRecord
    belongs_to :product
    belongs_to :drink
end
