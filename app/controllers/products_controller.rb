class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :destroy, :add]
    
    def index
    @products = Product.all
    end
    
    def show
    @product = Product.find(params[:id])
    end
    
    def add_to_cart
        @shoppingcart = ShoppingCart.create
        @product = Product.find(params[:id])
        @shoppingcart.add(@product, @product.price)
        redirect_to products_path
        end

    #def add_to_cart
    #@product.add_to_cart
    #end

    private

    def product_params
    params.require(:product).permit(:name, :category, :price)
    end

    def find_product
    @product = Product.find(params[:id])
    end

end
