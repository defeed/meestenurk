class DeliveryMethodsController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :authorize
  before_filter :get_cart
  # GET /delivery_methods
  # GET /delivery_methods.json
  def index
    @title = "Delivery Methods"
    
    @delivery_methods = DeliveryMethod.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delivery_methods }
    end
  end

  # GET /delivery_methods/new
  # GET /delivery_methods/new.json
  def new
    @delivery_method = DeliveryMethod.new
    @title = "New Delivery Method"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery_method }
    end
  end

  # GET /delivery_methods/1/edit
  def edit
    @delivery_method = DeliveryMethod.find(params[:id])
    @title = @delivery_method.name
  end

  # POST /delivery_methods
  # POST /delivery_methods.json
  def create
    @delivery_method = DeliveryMethod.new(params[:delivery_method])

    respond_to do |format|
      if @delivery_method.save
        format.html { redirect_to delivery_methods_path, notice: "Delivery Method #{@delivery_method.name} was added." }
        format.json { render json: @delivery_method, status: :created, location: @delivery_method }
      else
        format.html { render action: "new" }
        format.json { render json: @delivery_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_methods/1
  # PUT /delivery_methods/1.json
  def update
    @delivery_method = DeliveryMethod.find(params[:id])

    respond_to do |format|
      if @delivery_method.update_attributes(params[:delivery_method])
        format.html { redirect_to delivery_methods_path, notice: "Delivery Method #{@delivery_method.name} was updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_methods/1
  # DELETE /delivery_methods/1.json
  def destroy
    @delivery_method = DeliveryMethod.find(params[:id])

    respond_to do |format|
      format.html { redirect_to delivery_methods_url, notice: "Delivery Method #{@delivery_method.name} was removed." }
      format.json { head :no_content }
    end
    
    @delivery_method.destroy
  end
end
