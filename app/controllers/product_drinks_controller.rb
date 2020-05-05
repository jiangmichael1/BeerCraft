class ProductDrinksController < ApplicationController

    def new
    @users = User.all
    @drinks = Drink.all
    @products = Product.all
    @product_drinks = ProductDrink.new
    end




    
    
    private
    
    def product_drink_params
    params.require(:product_drinks).permit(:user_id, :drink_id, :product_id)
    end

end
