class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def new
        @product = ????.merchant.products.new
    end

    def create
        @product = ????.products.new(product_params)
        if @product.save!
            flash[:success] = "商品を追加しました。"
            redirect_to merchant_path(@merchant.id)
        end
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy
        redirect_to products_path
    end

    def show
        @product = Product.find(params[:id])
    end

    def get_image
        product = Product.find(params[:id])
        send_data product.image, disposition: :inline, type: 'product/png'
    end

    private
    def product_params
        image = params[:product][:image].read
        params.require(:product).permit(:merchant_id, :title, :price, :description, :image)
    end
end

