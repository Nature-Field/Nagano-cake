class Customer::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @addresses = ShippingAddress.all

  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to shipping_addresses_path, notice: "You have created book successfully."
    else @addresses = ShippingAddress.all
      render 'index'
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
    else
      render "edit"
    end
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to request.referer
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name, :customer_id)
  end

end
