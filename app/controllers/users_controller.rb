class UsersController < ApplicationController
    def new; end
  
    def show
      @user = current_user
    end
    
    def create
      @user = User.new(user_params)
      if @user.save!
        flash[:notice] = "登録が完了しました"
        redirect_to root_path
      else
        render 'new'
      end
  
      sign_in(@user)
    end
  
    private
    def user_params
      params.require(:user).permit(:user_name)
    end
  end
  