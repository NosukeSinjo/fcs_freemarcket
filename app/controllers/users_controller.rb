class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_name: params[:user][:user_name])
        if @user.save!
            flash[:notice] = "登録が完了しました"
            redirect_to "/userlogin"
        else
            render new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end
end
