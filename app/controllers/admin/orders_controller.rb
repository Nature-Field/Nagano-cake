class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order_total = 0
    @order_details.each do |o|
    @order_total += (o.price * o.quantity)
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params) && @order.status == 1
        OrderDetail.where(order_id: params[:id]).update_all(create_status: 1)
        redirect_back fallback_location: admin_order_path(@order)
    elsif !@order.update(order_params)
        render :show
    else  redirect_back fallback_location: admin_order_path(@order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:cost,:total_price,:payment_way,:status)
  end
end