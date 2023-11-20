class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "登録が完了しました"
            redirect_to top_login_path
        else
            render new_user_path
        end
    end
    
    def show
        @user = current_user
    end

    private
    def user_params
        params.require(:user).permit(:name)
    end
end
