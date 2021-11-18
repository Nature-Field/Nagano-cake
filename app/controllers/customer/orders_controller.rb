class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def create
    cart_products = current_customer.cart_products.all
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_products.each do |cart|
        order_detail = OrdeDetail.new
        order_detail.product_id = cart.product_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        order_detail.price = cart.product.price

        order_detail.save
      end
      redirect_to orders_confirm_path
      cart_products.destroy_all
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
    @order = Order.new(order_params)
  if params[:order][:address_number] == "1"
    @order.name = current_customer.last_name.to_s + current_customer.first_name.to_s
    @order.address = current_customer.address
    @order.postal_code = current_customer.postal_code
  elsif params[:order][:address_number] == "2"
    if Address.exists?(name: params[:order][:registered])
# registered は viwe で定義しています
      @order.name = Address.find(params[:order][:registered]).name
      @order.address = Address.find(params[:order][:registered]).address
    else
      render :new
    end
  elsif params[:order][:address_number] == "3"
    address_new = current_customer.addresses.new(address_params)
    if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
    else
      render :new
    end
  else
    redirect_to 遷移したいページ
  end
  @cart_products = current_customer.cart_products.all
  @total = @cart_products.inject(0) { |sum, item| sum + item.sum_price }
  end


  private

  def order_params
    params.require(:order).permit(:name, :address, :total_price, :payment_way, :postal_code, :address_number, :registered)
  end



end
