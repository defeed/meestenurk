class ProductsController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :authorize, :except => :show
  before_filter :get_cart
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @title = t('headers.products')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @title = "#{@product.brand.name} #{@product.title}"
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @title = t('headers.new_product')
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @title = "#{@product.brand.name} #{@product.title}"
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @title = t('headers.new_product')

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: "#{@product.brand.name} #{@product.title} was created." }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_url, notice: "#{@product.brand.name} #{@product.title} was updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.picture = nil
    @product.save

    respond_to do |format|
      format.html { redirect_to store_url, notice: "#{@product.brand.name} #{@product.title} was removed. Amen!" }
      format.json { head :no_content }
    end
    
    @product.destroy
  end
end
