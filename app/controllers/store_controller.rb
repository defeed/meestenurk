class StoreController < ApplicationController
  def index
    @products = Product.all
    @brands = Brand.all
    @categories = Category.all
  end
end
