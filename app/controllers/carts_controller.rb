class CartController < ApplicationController



    def list
    @items = Product.find(@cart)
    end

    def index
    @cart.all
    end

    def delete_item
        @cart.delete_at(params[:index].to_i)
        redirect_to product_path
    end


end
