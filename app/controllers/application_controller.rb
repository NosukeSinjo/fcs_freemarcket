class ApplicationController < ActionController::Base
        helper_method :current_user, :current_merchant, :merchant_logged_in?

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def sign_in(merchant)
        session[:merchant_id] = merchant.id
    end

    def sign_in(user)
        session[:user_id] = user.id
    end

    def merchant_logged_in?
        !current_merchant.nil?
    end

    def sign_out
        session[:id] = nil
    end

    def current_merchant
        @current_merchant ||= Merchant.find_by(id: session[:merchant_id]) if session[:merchant_id]
    end
end
