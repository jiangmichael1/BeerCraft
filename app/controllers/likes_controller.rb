class LikesController < ApplicationController
before_action :find_like, only: [:destroy]
before_action :find_drink

def new
@drinks = Drink.all
@users = User.all
@like = Like.new
end

def create
    if user_liked
        #prevents adding multiple likes
        flash[:notice] = "You can only like a drink once"
    else
    @drink.likes.create(user_id: @current_user.id)
    redirect_to drink_path(@drink)
    end
end

def find_like
#needed to remove a like
@like = @drink.likes.find(params[:id])
end

def destroy
if liked
    @like.destroy
end
end


private

def user_liked
    Like.where(user_id: @current_user.id, drink_id: params[:drink_id])
end

def find_drink
@drink = Drink.find(params[:drink_id])
end

end
