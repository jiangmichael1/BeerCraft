class CartsController < ApplicationController

    def add_item
        p = Product.find(params[:id])
        if !@cart.include?(p.id)
        @cart.push(p.id)
        end
        redirect_to product_path
    end

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
