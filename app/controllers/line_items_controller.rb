class LineItemsController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :get_cart
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: "#{@line_item.product.brand.name} #{@line_item.product.title} was added to your cart." }
        format.js
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /line_items/1
  # POST /line_items/1.json
  def decrement
    @cart = current_cart
    @line_item = @cart.decrement_line_item_quantity(params[:id])
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @cart }
        # format.js {@current_item = @line_item}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        # format.js {@current_item = @line_item}
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /line_items/1
  # PUT /line_items/1.json
  def increment
    @cart = current_cart

    @line_item = @cart.increment_line_item_quantity(params[:id])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @cart }
        # format.js {@current_item = @line_item}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        # format.js {@current_item = @line_item}
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      if current_cart.line_items.empty?
        format.html { redirect_to store_url, :notice=> 'Your cart is empty.' }
      else
        format.html { redirect_to @line_item.cart, :notice => "#{@line_item.product.brand.name} #{@line_item.product.title} removed from you cart." }
      end
      format.json { head :no_content }
    end
  end
end