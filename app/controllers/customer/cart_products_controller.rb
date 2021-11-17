class Customer::CartProductsController < ApplicationController

  def index
    #@cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products = current_customer.cart_products
  end

  def destroy_all
    products = current_customer.cart_products
    products.destroy_all
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  #def edit
  #end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.save(cart_product_params)
    redirect_to cart_products_path
  end



  def create
      CartProduct.create(customer_id: current_customer.id, quantity: params[:quantity], product_id: params[:product_id])
      @cart_products = CartProduct.where(customer_id: current_customer.id)
      @cart_product = CartProduct.new(cart_product_params)
      if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
        add_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
        add_product.quantity += params[:cart_product][:quantity].to_i
        add_product.save
        redirect_to cart_products_path
      else @cart_product.save
        redirect_to cart_products_path
      end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :customer_id, :product_id )
  end
end
