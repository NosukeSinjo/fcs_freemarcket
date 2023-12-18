class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    def new
        @product = Product.new
    end
    def create
        image = params[:product][:image].read
        @product = Product.new(title: params[:product][:title], price: params[:product][:price], description: params[:product][:description], image: image)
        @product.save
        redirect_to '/products'
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
end

