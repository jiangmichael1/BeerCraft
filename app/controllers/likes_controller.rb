# class LikesController < ApplicationController
# before_action :find_like, only: [:destroy, :update, :create, :new]
# before_action :find_drink

# def new
# @drinks = Drink.all
# @users = User.all
# @like = Like.new(like_params)
# end

# def create
#     @like = Like.new(like_params)
#     if @like.save
#         #prevents adding multiple likes
#         flash[:notice] = "You can only like a drink once"
#     else
#     Drink.likes.create(user_id: current_user.id)
#     redirect_to drink_path(@drink)
#     end
# end

# def find_like
# #needed to remove a like
# @like = Drink.likes.find(params[:id])
# end

# def destroy
# if user_liked
#     @like.destroy
# end
# end


# private

# def like_params
# params.require(:like).permit(:user_id, :drink_id)
# end

# def user_liked
#     Like.where(user_id: @current_user.id, drink_id: params[:drink_id])
# end

# def find_drink
# @drink = Drink.find(params[:drink_id])
# end

# end
