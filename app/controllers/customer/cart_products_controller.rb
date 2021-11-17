class Customer::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    #@cart_product = CartProduct.find_by(customer_id: current_customer.id)
  end


  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def edit
  end

  def update
  end

  def destroy_all
  end

  def create
    #if CartProduct.where(customer_id: current_customer.id).exists?
      #@search_cart = CartProduct.find_by(customer_id: current_customer.id)
      CartProduct.create(customer_id: current_customer.id, quantity: params[:quantity], product_id: params[:product_id])
      @cart_product = CartProduct.new(cart_product_params)
      @cart_product.save
      redirect_to cart_products_path
    #else
      #CartProduct.create(customer_id: current_customer.id, quantity: params[:quantity], product_id: params[:product_id])#これがうまくいってない
     # @cart_product = CartProduct.new(cart_product_params)
      #@cart_product.save
      #redirect_to cart_products_path
    #end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :customer_id, :product_id )
  end
end
