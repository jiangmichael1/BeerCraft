class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: [:new, :create]

    def new
    end

    def create
    @user = User.find_by(name: params[:session][:name])
        if @user && @user.authenticate(params[session][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Username or Password incorrect."
            redirect_to new_login_path
        end
    end

    def destroy
    session[:user_id] = nil
    redirect_to user_path
    end

end
