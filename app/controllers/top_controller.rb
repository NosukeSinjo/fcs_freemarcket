class TopController < ApplicationController
    def main
        render "login"
    end
    
    def login
        user = User.find_by(user_name: params[:user_name])
        if user
            session[:name] = user.user_name
            redirect_to merchants_path
        else
            render "login"
        end
    end

    def shoplogin
        merchant = Merchant.find_by(merchant_name: params[:merchant_name])
        if merchant
            session[:name] = merchant.merchant_name
            redirect_to merchant_path(merchant.id)
        else
            render "shoplogin"
        end
    end

    def logout
        reset_session
        redirect_to top_main_path
    end

    def shoplogout
        session.delete(:merchant_name)
        redirect_to top_main_path
    end
end
