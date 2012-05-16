class StoreController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :get_cart
  def index
    @products = Product.all
  end
end
