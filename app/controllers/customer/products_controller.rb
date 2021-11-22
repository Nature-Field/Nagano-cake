class Customer::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page]).reverse_order
    @products_all = Product.all
    @genres = Genre.all
    @q = Product.ransack(params[:q])
    @products_genre = @q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end
  
  def search
    @q = Product.search(search_params)
    @products = @q.result(distinct: true)
    @products_all = Product.all
  end
  
  private
  def search_params
    params.require(:q).permit(:genre_id_eq)
  end


end
