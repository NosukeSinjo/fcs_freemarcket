class ApplicationController < ActionController::Base
    private
        def current_user
            if session[:user_name]
                User.find_by(user_name: session[:user_name])
            end
        end
        helper_method :current_user
end
