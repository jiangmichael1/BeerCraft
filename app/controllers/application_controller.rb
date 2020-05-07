class ApplicationController < ActionController::Base
before_action :set_user
before_action :set_cart
before_action :authenticate_user

def set_user
@current_user = User.find_by_id(session[:user_id])
end

def authenticate_user
if @current_user
else
    redirect_to new_login_path
end
end

private

def set_cart
    session[:cart] ||= []
    @cart = session[:cart]
end

end
