class Customer::HomesController < ApplicationController

  def top
    @product = Product.limit(4).order(created_at: :desc)
    @image = @Product.image
  end

  def about
  end

end
