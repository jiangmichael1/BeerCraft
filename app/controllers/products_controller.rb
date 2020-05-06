class ProductsController < ApplicationController
    

    
    
    
    def add_to_cart
    @product = Product.find(params[:id])
    @current_cart << @product.id
        end
    end


end
