class OrdersController < ApplicationController
  before_filter :authorize, :only => [:index]
  before_filter :get_brands_and_categories
  before_filter :get_payment_and_delivery_methods
  before_filter :get_cart
  before_filter :get_line_items
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])    
    @line_items = @cart.line_items

    respond_to do |format|
      if @order.save
        
        @line_items.each do |item|
          @order_item = OrderItem.new
          @order_item.product_id = item.product_id
          @order_item.order_id = @order.id
          @order_item.quantity = item.quantity
          @order_item.save
        end
        
        @cart.destroy
        session[:cart_id] = nil
        
        format.html { redirect_to pay_order_url(@order), notice: "Your order was accepted. Now click the button below to pay with #{@order.payment_method.name}." }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
  
  def pay
    @order = Order.find(params[:id])
  end
end
