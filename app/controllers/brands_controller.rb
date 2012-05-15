class BrandsController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :authorize, :except => :show
  # GET /brands
  # GET /brands.json
  def index
    @title = "Brands"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products.paginate(:page => params[:page], :per_page => 15)
    
    @title = @brand.name
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @brand = Brand.new
    @title = "New Brand"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
    @title = @brand.name
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_path, notice: "Brand #{@brand.name} was added." }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to brands_path, notice: "Brand #{@brand.name} was updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html { redirect_to brands_url, notice: "Brand #{@brand.name} was removed. I hope you know what you're doing, mate." }
      format.json { head :no_content }
    end
    
    @brand.destroy
  end
end
