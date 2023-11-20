class ApplicationController < ActionController::Base
    private
        def current_user
            if session[:name]
                User.find_by(name: session[:name])
            end
        end
        helper_method :current_user
end
