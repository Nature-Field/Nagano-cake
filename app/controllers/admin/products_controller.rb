class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def new
    @product = Product.new

  end

  def create
    @product = Product.new(products_params)
    if @product.save
    redirect_to admin_product_path(@product)
    else
    redirect_to admin_products_path
    end
  end

  def update
  end


  private

  def products_params
    params.require(:product).permit(:genre_id, :is_active, :name, :explanation, :price, :image)
  end
end
