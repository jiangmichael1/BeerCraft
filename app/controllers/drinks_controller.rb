class DrinksController < ApplicationController
    before_action :find_drink, only: [:show, :edit]

    def index
    @drinks = Drink.all
    end

    def show
    @drink = Drink.find(params[:id])
    end

    def new
    @drink = Drink.new
    end

    def create 
    @drink = Drink.new(drink_params)
    if @drink.save
        redirect_to drink_path(@drink)
    else
        flash[:errors] = @drink.errors.full_messages
        redirect_to new_drink_path
        end
    end



    private

    def drink_params
        params.require(:drink).permit(:name, :recipe, :likes => 0)
    end

    def find_drink
        @drink = Drink.find(params[:id])
    end
end
