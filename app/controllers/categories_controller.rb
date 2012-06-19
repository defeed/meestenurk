class CategoriesController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :authorize, :except => :show
  before_filter :get_cart
  # GET /categories
  # GET /categories.json
  def index
    @title = t('headers.categories')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(:page => params[:page], :per_page => 15)

    @title = @category.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    @title = t('headers.new_category')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @title = @category.name
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
    @title = t('headers.new_category')

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Category #{@category.name} was added." }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to categories_path, notice: "Category #{@category.name} was updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category #{@category.name} was removed. I hope you know what you're doing, mate." }
      format.json { head :no_content }
    end
    
    @category.destroy
  end
end
