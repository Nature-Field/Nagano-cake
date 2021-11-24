class Customer::CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products
    # カートに入ってる商品の合計金額
    @total = @cart_products.inject(0) { |sum, product| sum + (product.sum_of_price*1.1).floor }
    @cart_products.each do |pr|
     @genre = pr.product.genre_id
    end
    @products = Product.where(genre_id: @genre)
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

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end


  def create
      @cart_products = current_customer.cart_products
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
