class Customer::HomesController < ApplicationController

  def top
    @product = Product.limit(4).order(created_at: :desc)
    @customer_fullname = current_customer.fullname
  end

  def about
  end

end
