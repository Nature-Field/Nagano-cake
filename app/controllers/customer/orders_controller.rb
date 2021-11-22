class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order.cost = 800 #送料
    @order_products_price = (@order.total_price.to_i - @order.cost)
    @order_details = @order.order_details
  end

  def create
    cart_products = current_customer.cart_products.all
    @order = current_customer.orders.new(order_params)
    @cart_products_all = current_customer.cart_products.all
    @total = @cart_products_all.inject(0) { |sum, item| sum + (item.sum_of_price*1.1).floor } # カートに入ってる商品の合計金額
    @order.cost = 800 #送料
    @order.total_price = (@total.to_i + @order.cost)
    if cart_products.present?
      if @order.save
        cart_products.each do |cart|
          order_detail = OrderDetail.new
          order_detail.product_id = cart.product_id
          order_detail.order_id = @order.id
          order_detail.quantity = cart.quantity
          order_detail.price = cart.product.price
          order_detail.save
        end
        redirect_to complete_orders_path
        cart_products.destroy_all
      else
        @order = Order.new(order_params)
        render :new
      end
    else
      redirect_to products_path
    end
  end

  def complete
  end

  def new
    @order = Order.new
    carts = current_customer.cart_products
    unless carts.present?
      redirect_to products_path
    end
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @cart_products = current_customer.cart_products.all
    @total = @cart_products.inject(0) { |sum, item| sum + (item.sum_of_price*1.1).floor }
    @order.cost = 800
    @order.total_price = (@total.to_i + @order.cost)
  if params[:order][:address_number] == "1"
    @order.name = current_customer.last_name. + current_customer.first_name
    @order.address = current_customer.address
    @order.postal_code = current_customer.postal_code
  elsif params[:order][:address_number] == "2"
    if ShippingAddress.where(params[:order][:address_id]).exists?
      order_address = ShippingAddress.find(params[:order][:address_id])
      @order.postal_code = order_address.postal_code
      @order.address     = order_address.address
      @order.name        = order_address.name
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    if @order.valid? == false
      render :new
    end

  else
    redirect_to new_order_path #遷移したいページ
  end

  end


  private


  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :total_price, :payment_way, :postal_code, :address, :cost, :address_id, :address_number)
  end



end
