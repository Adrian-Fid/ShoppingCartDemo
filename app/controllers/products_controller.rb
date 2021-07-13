class ProductsController < ApplicationController
  include ProductsHelper
  def index
    @products = Product.all
  end

  def create
    Product.delete_all
    uploaded_file = params[:products][:file]
    CSV.foreach(Rails.root.join('public', 'uploads', uploaded_file), headers: true) do |row|
      row = parseRow(row)
      Product.create!(row.to_h)
    end
    redirect_to products_path
  end
  #redirect_to product_path
end
