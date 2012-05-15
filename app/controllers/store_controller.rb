class StoreController < ApplicationController
  before_filter :get_brands_and_categories
  def index
    @products = Product.all
  end
end
