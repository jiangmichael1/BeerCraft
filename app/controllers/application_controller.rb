class ApplicationController < ActionController::Base
before_action :current_user
helper_method :current_cart

def current_user
@current_user = User.find_by_id(session[:user_id])
end
    
def current_cart
session[:cart] ||= []
end

end
