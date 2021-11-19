class SearchesController < ApplicationController
  def search
    @search_word = params["search_word"]
    @records = search_for(@search_word)
  end
  
  private
  def search_for(search_word)
    Product.where(name: search_word)
  end
end
