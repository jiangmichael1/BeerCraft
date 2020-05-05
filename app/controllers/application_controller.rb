class ApplicationController < ActionController::Base
before_action :set_user
helper_method :current_cart

def set_user
@current_user = User.find_by(id: session[:user_id])
end
    
def current_cart
session[:cart] ||= []
end

end
