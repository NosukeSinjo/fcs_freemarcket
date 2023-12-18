class MerchantsController < ApplicationController
    def index
        @merchants = Merchant.all
    end
    def new
        @merchant = Merchant.new
    end
    
    def create
        @merchant = Merchant.new(merchant_name: params[:merchant][:merchant_name])
        if @merchant.save!
            flash[:notice] = "登録が完了しました"
            redirect_to "/login"
        else
            render new_merchant_path
        end
    end

    def show
        @merchant = Merchant.find(params[:id])
        @products = @merchant.products
    end
end
