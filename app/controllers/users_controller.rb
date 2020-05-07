class UsersController < ApplicationController
    before_action :find_user, only: [:show, :destroy]
    
    def new
        @user = User.new 
    end
    
    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :password, :reason_for_visiting)
    end

    def find_user
        @user = User.find(params[:id])
    end


end
