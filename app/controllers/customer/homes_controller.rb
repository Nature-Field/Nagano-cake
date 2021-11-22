class Customer::HomesController < ApplicationController

  def top
    @product = Product.limit(4).order(created_at: :desc)
    @genres = Genre.all
    @q = Product.ransack(params[:q])
    @products_genre = @q.result(distinct: true)
  end

  def about
  end

end
