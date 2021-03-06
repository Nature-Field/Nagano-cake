class Customer::ShippingAddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @shipping_address = ShippingAddress.new
    @addresses = current_customer.shipping_addresses

  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to shipping_addresses_path, notice: "You have created address successfully."
    else @addresses = current_customer.shipping_addresses
      render 'index'
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "You have updated address successfully."
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
