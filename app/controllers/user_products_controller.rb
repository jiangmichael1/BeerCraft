class UserProductsController < ApplicationController
    
    def new
    @users = User.all
    @products = Product.all
    @user_product = UserProduct.new
    end

    
    private

    def user_product_params
    params.require(:user_products).permit(:user_id, :product_id)
    end





end
