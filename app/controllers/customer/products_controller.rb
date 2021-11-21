class Customer::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).reverse_order
    @products_all = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end


end
