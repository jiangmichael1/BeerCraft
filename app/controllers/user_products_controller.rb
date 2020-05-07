class UserProductsController < ApplicationController
    
    def new
    @users = User.all
    @products = Product.all
    @userproduct = UserProduct.new
    end

    def create
    @userproduct = UserProduct.new(user_product_params)
    @userproduct.save
    redirect_to user_path(@userproduct)
    end

    def add_item
    @product = Product.find(params[:id])
    @cart << @product
    @thing = UserProduct.create
    redirect_to user_path(@user)
    end

    def show
    @cart.all 
        redirect_to user_path(@userproduct)
    end
    
    private

    def user_product_params
    params.require(:user_products).permit(:user_id, :product_id)
    end





end
