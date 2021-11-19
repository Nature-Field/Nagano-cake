class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
  end

  def create
    @order = current_customer.orders.new(order_params)
    @cart_products = current_customer.cart_products.all
    @total = @cart_products.inject(0) { |sum, item| sum + item.sum_of_price } # カートに入ってる商品の合計金額
    @order.cost = 800 #送料
    @order.total_price = (@total.to_i + @order.cost)
    if @order.save
      @cart_products.each do |cart|
        order_detail = OrderDetail.new
        order_detail.product_id = cart.product_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        order_detail.price = cart.product.price
        order_detail.save
      end
      redirect_to order_compleat_path
      @cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def compleat
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @cart_products = current_customer.cart_products.all
    @total = @cart_products.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.cost = 800
    @order.total_price = (@total.to_i + @order.cost)
  if params[:order][:address_number] == "1"
    @order.name = current_customer.last_name. + current_customer.first_name
    @order.address = current_customer.address
    @order.postal_code = current_customer.postal_code
  elsif params[:order][:address_number] == "2"
    @order.name = ShippingAddress.find_by(params[:order][:name]).name
    @order.address = ShippingAddress.find_by(params[:order][:address]).address
    @order.postal_code = ShippingAddress.find_by(params[:order][:postal_code]).postal_code
  elsif params[:order][:address_number] == "3"
    if @order.save
    else
      render :new
    end
  else
    redirect_to new_order_path #遷移したいページ
  end

  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :total_price, :payment_way, :postal_code, :address, :cost, :registered)
  end



end
