class CartsController < ApplicationController
    include CartsHelper
    def index
        @carts = ShoppingCart.all
    end

    def show
        @cart = ShoppingCart.find(params[:id])
        @products = Product.all
    end

    def edit
        @cart = ShoppingCart.find(params[:id])
        @products = Product.all
        @cart.addProduct(params[:product_name], params[:amount].to_i)
        redirect_to cart_path
    end
    def create
        if params[:cart].nil?
            redirect_to carts_path
            return ShoppingCart.create(name: "new cart")
        end
        uploaded_file = params[:cart][:file]
        header = CSV.read(uploaded_file, headers: true).headers
        new_carts = createCarts(header)
        CSV.foreach(Rails.root.join('public', 'uploads', uploaded_file), headers: true) do |row|
            updateCarts(row, new_carts)
        end
        redirect_to carts_path
    end

    def destroy
        @cart = ShoppingCart.find(params[:id])
        @cart.destroy
        redirect_to carts_path
    end
end