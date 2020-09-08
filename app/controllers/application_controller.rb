class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @current_user = Order.find_by(seat_number:session[:user_id])
    end
end
